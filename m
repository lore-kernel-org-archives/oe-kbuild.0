Content-Type: multipart/mixed; boundary="===============6174188698475120026=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [zx2c4:jd/wireguard-azinc 1/3] drivers/net/wireguard/send.c:180 encrypt_packet() error: uninitialized symbol 'trailer'.
Date: Mon, 25 Nov 2019 09:24:07 +0300
Message-ID: <20191125062106.GC1749@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6174188698475120026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git jd/=
wireguard-azinc
head:   a513c826006403507e87a596ee8a00e57c39d6e4
commit: 2b36c25d88d5f0c47b6fd3e24ef026a10054a4b1 [1/3] net: WireGuard secur=
e network tunnel

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireguard/socket.c:413 wg_socket_init() warn: variable derefere=
nced before check 'new4' (see line 393)
drivers/net/wireguard/selftest/allowedips.c:419 randomized_test() error: do=
uble lock 'mutex:&mutex'

# https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git/commit/?i=
d=3D2b36c25d88d5f0c47b6fd3e24ef026a10054a4b1
git remote add zx2c4 https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/=
linux.git
git remote update zx2c4
git checkout 2b36c25d88d5f0c47b6fd3e24ef026a10054a4b1

drivers/net/wireguard/socket.c
   387  =

   388          ret =3D udp_sock_create(wg->creating_net, &port4, &new4);
   389          if (ret < 0) {
   390                  pr_err("%s: Could not create IPv4 socket\n", wg->de=
v->name);
   391                  return ret;
   392          }
   393          set_sock_opts(new4);
                ^^^^^^^^^^^^^^^^^^^
Dereferenced

   394          setup_udp_tunnel_sock(wg->creating_net, new4, &cfg);
   395  =

   396  #if IS_ENABLED(CONFIG_IPV6)
   397          if (ipv6_mod_enabled()) {
   398                  port6.local_udp_port =3D inet_sk(new4->sk)->inet_sp=
ort;
   399                  ret =3D udp_sock_create(wg->creating_net, &port6, &=
new6);
   400                  if (ret < 0) {
   401                          udp_tunnel_sock_release(new4);
   402                          if (ret =3D=3D -EADDRINUSE && !port && retr=
ies++ < 100)
   403                                  goto retry;
   404                          pr_err("%s: Could not create IPv6 socket\n",
   405                                 wg->dev->name);
   406                          return ret;
   407                  }
   408                  set_sock_opts(new6);
   409                  setup_udp_tunnel_sock(wg->creating_net, new6, &cfg);
   410          }
   411  #endif
   412  =

   413          wg_socket_reinit(wg, new4 ? new4->sk : NULL, new6 ? new6->s=
k : NULL);
                                     ^^^^
This check can be removed.

   414          return 0;
   415  }

drivers/net/wireguard/selftest/allowedips.c
   301          mutex_lock(&mutex);
   302  =

   303          for (i =3D 0; i < NUM_RAND_ROUTES; ++i) {
   304                  prandom_bytes(ip, 4);
   305                  cidr =3D prandom_u32_max(32) + 1;
   306                  peer =3D peers[prandom_u32_max(NUM_PEERS)];
   307                  if (wg_allowedips_insert_v4(&t, (struct in_addr *)i=
p, cidr,
   308                                              peer, &mutex) < 0) {
   309                          pr_err("allowedips random self-test malloc:=
 FAIL\n");
   310                          goto free;
                                ^^^^^^^^^^
Mutex non necessarily released on error.

   311                  }
   312                  if (horrible_allowedips_insert_v4(&h, (struct in_ad=
dr *)ip,
   313                                                    cidr, peer) < 0) {
   314                          pr_err("allowedips random self-test malloc:=
 FAIL\n");
   315                          goto free;
   316                  }
   317                  for (j =3D 0; j < NUM_MUTATED_ROUTES; ++j) {
   318                          memcpy(mutated, ip, 4);
   319                          prandom_bytes(mutate_mask, 4);
   320                          mutate_amount =3D prandom_u32_max(32);
   321                          for (k =3D 0; k < mutate_amount / 8; ++k)

[ snip ]

   418  free:
   419          mutex_lock(&mutex);
                ^^^^^^^^^^^^^^^^^^
Double lock.

   420          wg_allowedips_free(&t, &mutex);
   421          mutex_unlock(&mutex);
   422          horrible_allowedips_free(&h);
   423          if (peers) {
   424                  for (i =3D 0; i < NUM_PEERS; ++i)
   425                          kfree(peers[i]);
   426          }
   427          kfree(peers);
   428          return ret;
   429  }
   430  =



---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corpor=
ation
--===============6174188698475120026==--

