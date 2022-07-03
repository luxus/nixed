let
  system-vanessa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/AjBtg8D4lMoBkp2L3dDb5EmkOGr1v/Ns1wwRoKds4";
  luxus-user-vanessa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/AjBtg8D4lMoBkp2L3dDb5EmkOGr1v/Ns1wwRoKds4";
  vanessaKeys = [ system-vanessa luxus-user-vanessa ];

  system-emily = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/AjBtg8D4lMoBkp2L3dDb5EmkOGr1v/Ns1wwRoKds4";
  luxus-user-emily = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/AjBtg8D4lMoBkp2L3dDb5EmkOGr1v/Ns1wwRoKds4";
  emilyKeys = [ system-emily luxus-user-emily ];
in
{
  "luxus-user-vanessa.age".publicKeys = vanessaKeys;
  "root-user-vanessa.age".publicKeys = [ system-vanessa ];

  "luxus-user-emily.age".publicKeys = emilyKeys;
  "root-user-emily.age".publicKeys = [ system-emily ];
}
