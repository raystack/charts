.PHONY: template-all deps deps-update

# Build dependencies from lock files (for CI)
deps:
	@for chart in stable/*/; do \
		if [ -f "$${chart}Chart.yaml" ] && [ -f "$${chart}Chart.lock" ]; then \
			chart_name=$$(basename "$$chart"); \
			echo "Building dependencies for $$chart_name..."; \
			helm dependency build "$$chart"; \
		fi; \
	done

# Update dependencies and refresh lock files (for development)
deps-update:
	@for chart in stable/*/; do \
		if [ -f "$${chart}Chart.yaml" ]; then \
			if grep -q "dependencies:" "$${chart}Chart.yaml"; then \
				chart_name=$$(basename "$$chart"); \
				echo "Updating dependencies for $$chart_name..."; \
				helm dependency update "$$chart"; \
			fi; \
		fi; \
	done

template-all:
	@failed=0; \
	for chart in stable/*/; do \
		if [ -f "$${chart}Chart.yaml" ]; then \
			chart_name=$$(basename "$$chart"); \
			echo "Validating $$chart_name..."; \
			if helm template test-release "$$chart" > /dev/null 2>&1; then \
				echo "✓ $$chart_name rendered successfully"; \
			else \
				echo "✗ $$chart_name failed to render:"; \
				helm template test-release "$$chart"; \
				failed=1; \
			fi; \
			echo ""; \
		fi; \
	done; \
	if [ $$failed -eq 1 ]; then \
		echo "Some charts failed validation"; \
		exit 1; \
	fi