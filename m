Content-Type: multipart/mixed; boundary="===============4858341397030106795=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 03/11] ipv6/addrconf: switch to per netns inet6_addr_lst hash table
Date: Tue, 08 Feb 2022 07:36:22 +0800
Message-ID: <202202080738.dLlV5UtO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4858341397030106795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220207171756.1304544-4-eric.dumazet@gmail.com>
References: <20220207171756.1304544-4-eric.dumazet@gmail.com>
TO: Eric Dumazet <eric.dumazet@gmail.com>

Hi Eric,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Eric-Dumazet/net-speedup-n=
etns-dismantles/20220208-013735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
ff62433883b3ab753a78954ecf46e2c514f5c407
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-m021-20220207 (https://download.01.org/0day-ci/arch=
ive/20220208/202202080738.dLlV5UtO-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv6/addrconf.c:4303 if6_get_next() warn: ignoring unreachable code.

vim +4303 net/ipv6/addrconf.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  4296  =

c2e21293c054817 stephen hemminger 2010-03-17  4297  static struct inet6_ifa=
ddr *if6_get_next(struct seq_file *seq,
c2e21293c054817 stephen hemminger 2010-03-17  4298  					 struct inet6_ifad=
dr *ifa)
^1da177e4c3f415 Linus Torvalds    2005-04-16  4299  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  4300  	struct if6_iter_state =
*state =3D seq->private;
1218854afa6f659 YOSHIFUJI Hideaki 2008-03-26  4301  	struct net *net =3D se=
q_file_net(seq);
^1da177e4c3f415 Linus Torvalds    2005-04-16  4302  =

a5c1d98f8ccf435 Eric Dumazet      2017-10-23 @4303  	hlist_for_each_entry_c=
ontinue_rcu(ifa, addr_lst) {
1d5783030a14d1b Mihai Maruseac    2012-01-03  4304  		state->offset++;
c2e21293c054817 stephen hemminger 2010-03-17  4305  		return ifa;
1d5783030a14d1b Mihai Maruseac    2012-01-03  4306  	}
3c40090a0f5b69d Daniel Lezcano    2008-01-10  4307  =

1d5783030a14d1b Mihai Maruseac    2012-01-03  4308  	state->offset =3D 0;
86f9bd1ff61c413 Jeff Barnhill     2018-09-21  4309  	while (++state->bucket=
 < IN6_ADDR_HSIZE) {
a5c1d98f8ccf435 Eric Dumazet      2017-10-23  4310  		hlist_for_each_entry_=
rcu(ifa,
7d7f3230f635f60 Eric Dumazet      2022-02-07  4311  				     &net->ipv6.ine=
t6_addr_lst[state->bucket], addr_lst) {
c2e21293c054817 stephen hemminger 2010-03-17  4312  			return ifa;
c2e21293c054817 stephen hemminger 2010-03-17  4313  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  4314  	}
3c40090a0f5b69d Daniel Lezcano    2008-01-10  4315  =

c2e21293c054817 stephen hemminger 2010-03-17  4316  	return NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  4317  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  4318  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4858341397030106795==--

