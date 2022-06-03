Content-Type: multipart/mixed; boundary="===============0246771888914768996=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ax25: use GFP_KERNEL over GFP_ATOMIC where possible
Date: Fri, 03 Jun 2022 15:37:17 +0800
Message-ID: <202206031536.t0bHoh3z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0246771888914768996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220602112138.8200-1-pjlafren@mtu.edu>
References: <20220602112138.8200-1-pjlafren@mtu.edu>
TO: Peter Lafreniere <pjlafren@mtu.edu>
TO: linux-hams(a)vger.kernel.org
CC: ralf(a)linux-mips.org
CC: netdev(a)vger.kernel.org
CC: Peter Lafreniere <pjlafren@mtu.edu>

Hi Peter,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on horms-ipvs/master]
[also build test WARNING on net/master net-next/master linus/master v5.18 n=
ext-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Lafreniere/ax2=
5-use-GFP_KERNEL-over-GFP_ATOMIC-where-possible/20220602-192326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git mast=
er
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: nios2-randconfig-m031-20220601 (https://download.01.org/0day-ci/arc=
hive/20220603/202206031536.t0bHoh3z-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ax25/ax25_route.c:94 ax25_rt_add() warn: sleeping in atomic context

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninit=
ialized symbol 'sp'.
net/ax25/ax25_route.c:113 ax25_rt_add() warn: sleeping in atomic context

vim +94 net/ax25/ax25_route.c

^1da177e4c3f415 Linus Torvalds   2005-04-16   71  =

c9266b99e2def0a Ralf Baechle     2006-12-14   72  static int __must_check a=
x25_rt_add(struct ax25_routes_struct *route)
^1da177e4c3f415 Linus Torvalds   2005-04-16   73  {
^1da177e4c3f415 Linus Torvalds   2005-04-16   74  	ax25_route *ax25_rt;
^1da177e4c3f415 Linus Torvalds   2005-04-16   75  	ax25_dev *ax25_dev;
^1da177e4c3f415 Linus Torvalds   2005-04-16   76  	int i;
^1da177e4c3f415 Linus Torvalds   2005-04-16   77  =

^1da177e4c3f415 Linus Torvalds   2005-04-16   78  	if (route->digi_count > =
AX25_MAX_DIGIS)
^1da177e4c3f415 Linus Torvalds   2005-04-16   79  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds   2005-04-16   80  =

87563a043cef044 Duoming Zhou     2022-02-03   81  	ax25_dev =3D ax25_addr_a=
x25dev(&route->port_addr);
87563a043cef044 Duoming Zhou     2022-02-03   82  	if (!ax25_dev)
87563a043cef044 Duoming Zhou     2022-02-03   83  		return -EINVAL;
87563a043cef044 Duoming Zhou     2022-02-03   84  =

4de211f1a279275 Jarek Poplawski  2008-02-11   85  	write_lock_bh(&ax25_rout=
e_lock);
^1da177e4c3f415 Linus Torvalds   2005-04-16   86  =

^1da177e4c3f415 Linus Torvalds   2005-04-16   87  	ax25_rt =3D ax25_route_l=
ist;
^1da177e4c3f415 Linus Torvalds   2005-04-16   88  	while (ax25_rt !=3D NULL=
) {
^1da177e4c3f415 Linus Torvalds   2005-04-16   89  		if (ax25cmp(&ax25_rt->c=
allsign, &route->dest_addr) =3D=3D 0 &&
^1da177e4c3f415 Linus Torvalds   2005-04-16   90  			    ax25_rt->dev =3D=
=3D ax25_dev->dev) {
^1da177e4c3f415 Linus Torvalds   2005-04-16   91  			kfree(ax25_rt->digipea=
t);
^1da177e4c3f415 Linus Torvalds   2005-04-16   92  			ax25_rt->digipeat =3D =
NULL;
^1da177e4c3f415 Linus Torvalds   2005-04-16   93  			if (route->digi_count =
!=3D 0) {
10c95f710e8899b Peter Lafreniere 2022-06-02  @94  				if ((ax25_rt->digipea=
t =3D kmalloc(sizeof(ax25_digi), GFP_KERNEL)) =3D=3D NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11   95  					write_unlock_bh(&ax2=
5_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03   96  					ax25_dev_put(ax25_de=
v);
^1da177e4c3f415 Linus Torvalds   2005-04-16   97  					return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16   98  				}
^1da177e4c3f415 Linus Torvalds   2005-04-16   99  				ax25_rt->digipeat->la=
strepeat =3D -1;
^1da177e4c3f415 Linus Torvalds   2005-04-16  100  				ax25_rt->digipeat->nd=
igi      =3D route->digi_count;
^1da177e4c3f415 Linus Torvalds   2005-04-16  101  				for (i =3D 0; i < rou=
te->digi_count; i++) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  102  					ax25_rt->digipeat->r=
epeated[i] =3D 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  103  					ax25_rt->digipeat->c=
alls[i]    =3D route->digi_addr[i];
^1da177e4c3f415 Linus Torvalds   2005-04-16  104  				}
^1da177e4c3f415 Linus Torvalds   2005-04-16  105  			}
4de211f1a279275 Jarek Poplawski  2008-02-11  106  			write_unlock_bh(&ax25_=
route_lock);
87563a043cef044 Duoming Zhou     2022-02-03  107  			ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  108  			return 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  109  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  110  		ax25_rt =3D ax25_rt->ne=
xt;
^1da177e4c3f415 Linus Torvalds   2005-04-16  111  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  112  =

10c95f710e8899b Peter Lafreniere 2022-06-02  113  	if ((ax25_rt =3D kmalloc=
(sizeof(ax25_route), GFP_KERNEL)) =3D=3D NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11  114  		write_unlock_bh(&ax25_r=
oute_lock);
87563a043cef044 Duoming Zhou     2022-02-03  115  		ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  116  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16  117  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  118  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  119  	ax25_rt->callsign     =
=3D route->dest_addr;
^1da177e4c3f415 Linus Torvalds   2005-04-16  120  	ax25_rt->dev          =
=3D ax25_dev->dev;
^1da177e4c3f415 Linus Torvalds   2005-04-16  121  	ax25_rt->digipeat     =
=3D NULL;
^1da177e4c3f415 Linus Torvalds   2005-04-16  122  	ax25_rt->ip_mode      =
=3D ' ';
^1da177e4c3f415 Linus Torvalds   2005-04-16  123  	if (route->digi_count !=
=3D 0) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  124  		if ((ax25_rt->digipeat =
=3D kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) =3D=3D NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11  125  			write_unlock_bh(&ax25_=
route_lock);
^1da177e4c3f415 Linus Torvalds   2005-04-16  126  			kfree(ax25_rt);
87563a043cef044 Duoming Zhou     2022-02-03  127  			ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  128  			return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16  129  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  130  		ax25_rt->digipeat->last=
repeat =3D -1;
^1da177e4c3f415 Linus Torvalds   2005-04-16  131  		ax25_rt->digipeat->ndig=
i      =3D route->digi_count;
^1da177e4c3f415 Linus Torvalds   2005-04-16  132  		for (i =3D 0; i < route=
->digi_count; i++) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  133  			ax25_rt->digipeat->rep=
eated[i] =3D 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  134  			ax25_rt->digipeat->cal=
ls[i]    =3D route->digi_addr[i];
^1da177e4c3f415 Linus Torvalds   2005-04-16  135  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  136  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  137  	ax25_rt->next   =3D ax25=
_route_list;
^1da177e4c3f415 Linus Torvalds   2005-04-16  138  	ax25_route_list =3D ax25=
_rt;
4de211f1a279275 Jarek Poplawski  2008-02-11  139  	write_unlock_bh(&ax25_ro=
ute_lock);
87563a043cef044 Duoming Zhou     2022-02-03  140  	ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  141  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  142  	return 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  143  }
^1da177e4c3f415 Linus Torvalds   2005-04-16  144  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0246771888914768996==--

