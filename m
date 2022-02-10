Content-Type: multipart/mixed; boundary="===============5795939419863777360=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tnguy-next-queue:dev-queue 102/204] net/ipv6/addrconf.c:4303 if6_get_next() warn: ignoring unreachable code.
Date: Thu, 10 Feb 2022 13:46:13 +0800
Message-ID: <202202101345.ddaV13j0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5795939419863777360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
CC: linux-kernel(a)vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: David Ahern <dsahern@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.gi=
t dev-queue
head:   f44ab3c99a0ec7a0654ad0e3951bf07f4bff9a61
commit: e66d117222047ea90f92e065f929bc0e0eec3647 [102/204] ipv6/addrconf: s=
witch to per netns inet6_addr_lst hash table
:::::: branch date: 8 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20210/202202101345.ddaV13j0-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv6/addrconf.c:4303 if6_get_next() warn: ignoring unreachable code.

vim +4303 net/ipv6/addrconf.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  4296  =

c2e21293c05481 stephen hemminger 2010-03-17  4297  static struct inet6_ifad=
dr *if6_get_next(struct seq_file *seq,
c2e21293c05481 stephen hemminger 2010-03-17  4298  					 struct inet6_ifadd=
r *ifa)
^1da177e4c3f41 Linus Torvalds    2005-04-16  4299  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  4300  	struct if6_iter_state *=
state =3D seq->private;
1218854afa6f65 YOSHIFUJI Hideaki 2008-03-26  4301  	struct net *net =3D seq=
_file_net(seq);
^1da177e4c3f41 Linus Torvalds    2005-04-16  4302  =

a5c1d98f8ccf43 Eric Dumazet      2017-10-23 @4303  	hlist_for_each_entry_co=
ntinue_rcu(ifa, addr_lst) {
1d5783030a14d1 Mihai Maruseac    2012-01-03  4304  		state->offset++;
c2e21293c05481 stephen hemminger 2010-03-17  4305  		return ifa;
1d5783030a14d1 Mihai Maruseac    2012-01-03  4306  	}
3c40090a0f5b69 Daniel Lezcano    2008-01-10  4307  =

1d5783030a14d1 Mihai Maruseac    2012-01-03  4308  	state->offset =3D 0;
86f9bd1ff61c41 Jeff Barnhill     2018-09-21  4309  	while (++state->bucket =
< IN6_ADDR_HSIZE) {
a5c1d98f8ccf43 Eric Dumazet      2017-10-23  4310  		hlist_for_each_entry_r=
cu(ifa,
e66d117222047e Eric Dumazet      2022-02-07  4311  				     &net->ipv6.inet=
6_addr_lst[state->bucket], addr_lst) {
c2e21293c05481 stephen hemminger 2010-03-17  4312  			return ifa;
c2e21293c05481 stephen hemminger 2010-03-17  4313  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  4314  	}
3c40090a0f5b69 Daniel Lezcano    2008-01-10  4315  =

c2e21293c05481 stephen hemminger 2010-03-17  4316  	return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  4317  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  4318  =


:::::: The code at line 4303 was first introduced by commit
:::::: a5c1d98f8ccf4359575772b36ed51f5857dd7165 ipv6: addrconf: do not bloc=
k BH in /proc/net/if_inet6 handling

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5795939419863777360==--

