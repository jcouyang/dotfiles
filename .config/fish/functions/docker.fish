function drmv
  set -l vs (docker volume ls | awk '{print $2}')
  for v in $vs
    if test (string length $v) = 64
      docker volume rm $v
    end
  end
end

function drm
  set -l containers (docker ps -a -q)
  docker rm $containers
end
