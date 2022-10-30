let jcouyang = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGhfpxJ/AZBdgxo/NzWLn6B/C2as0yovFS4eGllEkWSJ jcouyang@nixos";
in {
  ".netrc.age".publicKeys = [jcouyang];
  ".npmrc.age".publicKeys = [jcouyang];
  "gh_hosts.yaml.age".publicKeys = [jcouyang];
}
