let jcouyang = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGhfpxJ/AZBdgxo/NzWLn6B/C2as0yovFS4eGllEkWSJ jcouyang@nixos";
in {
  ".netrc.age".publicKeys = [jcouyang];
  ".npmrc.age".publicKeys = [jcouyang];
  "gh_hosts.yaml.age".publicKeys = [jcouyang];
  "offlineimap/gmailpass.age".publicKeys = [jcouyang];
  ".gnupg/private-keys-v1.d/2A0BB05C11426C0139CBEA1A585016FB56501C7E.key.age".publicKeys = [jcouyang];
  ".gnupg/private-keys-v1.d/A7DE317190BAB97FC5A74683A030E0D9D9A2260F.key.age".publicKeys = [jcouyang];
  ".gnupg/private-keys-v1.d/88B4B2BA07BD6ADABB37C36823CDD6C4CCA82BC9.key.age".publicKeys = [jcouyang];
  ".gnupg/private-keys-v1.d/F16D8189E390505416D5EB2C147E02479A7E0133.key.age".publicKeys = [jcouyang];
}
