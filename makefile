all: analysis data-preparation

data-preparation:
		make -C src/data-preparation

analysis:
		make -C src/analysis
	
