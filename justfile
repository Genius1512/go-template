build pkg="all":
  @./scripts/build.sh {{pkg}}

test pkg="all":
  @./scripts/test.sh {{pkg}}

clean:
  @rm -rf bin

