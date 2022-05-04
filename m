Content-Type: multipart/mixed; boundary="===============6553662234035688798=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:flexcpy/next-20220502 6/34] net/ipv4/ip_options.c:154 __ip_options_echo() warn: potential spectre issue 'start' [r]
Date: Wed, 04 May 2022 18:25:51 +0800
Message-ID: <202205041839.lCNMvkmN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6553662234035688798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git flex=
cpy/next-20220502
head:   1dbd8181297512b190aca23477043ac635daba4e
commit: f72034cf9d13b64d3d457b6da825bde7fe758a27 [6/34] fortify: Add run-ti=
me WARN for cross-field memcpy()
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20504/202205041839.lCNMvkmN-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv4/ip_options.c:154 __ip_options_echo() warn: potential spectre issue=
 'start' [r]
net/ipv4/ip_options.c:616 ip_options_rcv_srr() warn: potential spectre issu=
e 'optptr' [r]

Old smatch warnings:
net/ipv4/ip_options.c:547 ip_forward_options() warn: potential spectre issu=
e 'optptr' [w]
net/ipv4/ip_options.c:556 ip_forward_options() warn: possible spectre secon=
d half.  'srrptr'
net/ipv4/ip_options.c:556 ip_forward_options() warn: possible spectre secon=
d half.  'srrspace'

vim +/start +154 net/ipv4/ip_options.c

^1da177e4c3f41 Linus Torvalds           2005-04-16   67  =

^1da177e4c3f41 Linus Torvalds           2005-04-16   68  /*
^1da177e4c3f41 Linus Torvalds           2005-04-16   69   * Provided (sopt,=
 skb) points to received options,
^1da177e4c3f41 Linus Torvalds           2005-04-16   70   * build in dopt c=
ompiled option set appropriate for answering.
^1da177e4c3f41 Linus Torvalds           2005-04-16   71   * i.e. invert SRR=
 option, copy anothers,
^1da177e4c3f41 Linus Torvalds           2005-04-16   72   * and grab room i=
n RR/TS options.
^1da177e4c3f41 Linus Torvalds           2005-04-16   73   *
^1da177e4c3f41 Linus Torvalds           2005-04-16   74   * NOTE: dopt cann=
ot point to skb.
^1da177e4c3f41 Linus Torvalds           2005-04-16   75   */
^1da177e4c3f41 Linus Torvalds           2005-04-16   76  =

91ed1e666a4ea2 Paolo Abeni              2017-08-03   77  int __ip_options_e=
cho(struct net *net, struct ip_options *dopt,
91ed1e666a4ea2 Paolo Abeni              2017-08-03   78  		      struct sk_=
buff *skb, const struct ip_options *sopt)
^1da177e4c3f41 Linus Torvalds           2005-04-16   79  {
^1da177e4c3f41 Linus Torvalds           2005-04-16   80  	unsigned char *sp=
tr, *dptr;
^1da177e4c3f41 Linus Torvalds           2005-04-16   81  	int soffset, doff=
set;
^1da177e4c3f41 Linus Torvalds           2005-04-16   82  	int	optlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16   83  =

^1da177e4c3f41 Linus Torvalds           2005-04-16   84  	memset(dopt, 0, s=
izeof(struct ip_options));
^1da177e4c3f41 Linus Torvalds           2005-04-16   85  =

f6d8bd051c391c Eric Dumazet             2011-04-21   86  	if (sopt->optlen =
=3D=3D 0)
^1da177e4c3f41 Linus Torvalds           2005-04-16   87  		return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16   88  =

d56f90a7c96da5 Arnaldo Carvalho de Melo 2007-04-10   89  	sptr =3D skb_netw=
ork_header(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16   90  	dptr =3D dopt->__=
data;
^1da177e4c3f41 Linus Torvalds           2005-04-16   91  =

^1da177e4c3f41 Linus Torvalds           2005-04-16   92  	if (sopt->rr) {
^1da177e4c3f41 Linus Torvalds           2005-04-16   93  		optlen  =3D sptr=
[sopt->rr+1];
^1da177e4c3f41 Linus Torvalds           2005-04-16   94  		soffset =3D sptr=
[sopt->rr+2];
^1da177e4c3f41 Linus Torvalds           2005-04-16   95  		dopt->rr =3D dop=
t->optlen + sizeof(struct iphdr);
^1da177e4c3f41 Linus Torvalds           2005-04-16   96  		memcpy(dptr, spt=
r+sopt->rr, optlen);
^1da177e4c3f41 Linus Torvalds           2005-04-16   97  		if (sopt->rr_nee=
daddr && soffset <=3D optlen) {
^1da177e4c3f41 Linus Torvalds           2005-04-16   98  			if (soffset + 3=
 > optlen)
^1da177e4c3f41 Linus Torvalds           2005-04-16   99  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  100  			dptr[2] =3D sof=
fset + 4;
^1da177e4c3f41 Linus Torvalds           2005-04-16  101  			dopt->rr_needad=
dr =3D 1;
^1da177e4c3f41 Linus Torvalds           2005-04-16  102  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  103  		dptr +=3D optlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  104  		dopt->optlen +=
=3D optlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  105  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  106  	if (sopt->ts) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  107  		optlen =3D sptr[=
sopt->ts+1];
^1da177e4c3f41 Linus Torvalds           2005-04-16  108  		soffset =3D sptr=
[sopt->ts+2];
^1da177e4c3f41 Linus Torvalds           2005-04-16  109  		dopt->ts =3D dop=
t->optlen + sizeof(struct iphdr);
^1da177e4c3f41 Linus Torvalds           2005-04-16  110  		memcpy(dptr, spt=
r+sopt->ts, optlen);
^1da177e4c3f41 Linus Torvalds           2005-04-16  111  		if (soffset <=3D=
 optlen) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  112  			if (sopt->ts_ne=
edaddr) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  113  				if (soffset + =
3 > optlen)
^1da177e4c3f41 Linus Torvalds           2005-04-16  114  					return -EINVA=
L;
^1da177e4c3f41 Linus Torvalds           2005-04-16  115  				dopt->ts_needa=
ddr =3D 1;
^1da177e4c3f41 Linus Torvalds           2005-04-16  116  				soffset +=3D 4;
^1da177e4c3f41 Linus Torvalds           2005-04-16  117  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  118  			if (sopt->ts_ne=
edtime) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  119  				if (soffset + =
3 > optlen)
^1da177e4c3f41 Linus Torvalds           2005-04-16  120  					return -EINVA=
L;
^1da177e4c3f41 Linus Torvalds           2005-04-16  121  				if ((dptr[3]&0=
xF) !=3D IPOPT_TS_PRESPEC) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  122  					dopt->ts_need=
time =3D 1;
^1da177e4c3f41 Linus Torvalds           2005-04-16  123  					soffset +=3D =
4;
^1da177e4c3f41 Linus Torvalds           2005-04-16  124  				} else {
^1da177e4c3f41 Linus Torvalds           2005-04-16  125  					dopt->ts_need=
time =3D 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  126  =

8628bd8af7c4c1 Jan Luebbe               2011-03-24  127  					if (soffset +=
 7 <=3D optlen) {
fd683222097480 Al Viro                  2006-09-26  128  						__be32 addr;
^1da177e4c3f41 Linus Torvalds           2005-04-16  129  =

8628bd8af7c4c1 Jan Luebbe               2011-03-24  130  						memcpy(&addr=
, dptr+soffset-1, 4);
91ed1e666a4ea2 Paolo Abeni              2017-08-03  131  						if (inet_add=
r_type(net, addr) !=3D RTN_UNICAST) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  132  							dopt->ts_ne=
edtime =3D 1;
^1da177e4c3f41 Linus Torvalds           2005-04-16  133  							soffset +=
=3D 8;
^1da177e4c3f41 Linus Torvalds           2005-04-16  134  						}
^1da177e4c3f41 Linus Torvalds           2005-04-16  135  					}
^1da177e4c3f41 Linus Torvalds           2005-04-16  136  				}
^1da177e4c3f41 Linus Torvalds           2005-04-16  137  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  138  			dptr[2] =3D sof=
fset;
^1da177e4c3f41 Linus Torvalds           2005-04-16  139  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  140  		dptr +=3D optlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  141  		dopt->optlen +=
=3D optlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  142  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  143  	if (sopt->srr) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  144  		unsigned char *s=
tart =3D sptr+sopt->srr;
3ca3c68e76686b Al Viro                  2006-09-27  145  		__be32 faddr;
^1da177e4c3f41 Linus Torvalds           2005-04-16  146  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  147  		optlen  =3D star=
t[1];
^1da177e4c3f41 Linus Torvalds           2005-04-16  148  		soffset =3D star=
t[2];
^1da177e4c3f41 Linus Torvalds           2005-04-16  149  		doffset =3D 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  150  		if (soffset > op=
tlen)
^1da177e4c3f41 Linus Torvalds           2005-04-16  151  			soffset =3D opt=
len + 1;
^1da177e4c3f41 Linus Torvalds           2005-04-16  152  		soffset -=3D 4;
^1da177e4c3f41 Linus Torvalds           2005-04-16  153  		if (soffset > 3)=
 {
^1da177e4c3f41 Linus Torvalds           2005-04-16 @154  			memcpy(&faddr, =
&start[soffset-1], 4);
^1da177e4c3f41 Linus Torvalds           2005-04-16  155  			for (soffset -=
=3D 4, doffset =3D 4; soffset > 3; soffset -=3D 4, doffset +=3D 4)
^1da177e4c3f41 Linus Torvalds           2005-04-16  156  				memcpy(&dptr[d=
offset-1], &start[soffset-1], 4);
^1da177e4c3f41 Linus Torvalds           2005-04-16  157  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  158  			 * RFC1812 requ=
ires to fix illegal source routes.
^1da177e4c3f41 Linus Torvalds           2005-04-16  159  			 */
eddc9ec53be2ec Arnaldo Carvalho de Melo 2007-04-20  160  			if (memcmp(&ip_=
hdr(skb)->saddr,
eddc9ec53be2ec Arnaldo Carvalho de Melo 2007-04-20  161  				   &start[soff=
set + 3], 4) =3D=3D 0)
^1da177e4c3f41 Linus Torvalds           2005-04-16  162  				doffset -=3D 4;
^1da177e4c3f41 Linus Torvalds           2005-04-16  163  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  164  		if (doffset > 3)=
 {
^1da177e4c3f41 Linus Torvalds           2005-04-16  165  			dopt->faddr =3D=
 faddr;
^1da177e4c3f41 Linus Torvalds           2005-04-16  166  			dptr[0] =3D sta=
rt[0];
^1da177e4c3f41 Linus Torvalds           2005-04-16  167  			dptr[1] =3D dof=
fset+3;
^1da177e4c3f41 Linus Torvalds           2005-04-16  168  			dptr[2] =3D 4;
^1da177e4c3f41 Linus Torvalds           2005-04-16  169  			dptr +=3D doffs=
et+3;
^1da177e4c3f41 Linus Torvalds           2005-04-16  170  			dopt->srr =3D d=
opt->optlen + sizeof(struct iphdr);
^1da177e4c3f41 Linus Torvalds           2005-04-16  171  			dopt->optlen +=
=3D doffset+3;
^1da177e4c3f41 Linus Torvalds           2005-04-16  172  			dopt->is_strict=
route =3D sopt->is_strictroute;
^1da177e4c3f41 Linus Torvalds           2005-04-16  173  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  174  	}
11a03f78fbf15a Paul Moore               2006-08-03  175  	if (sopt->cipso) {
11a03f78fbf15a Paul Moore               2006-08-03  176  		optlen  =3D sptr=
[sopt->cipso+1];
11a03f78fbf15a Paul Moore               2006-08-03  177  		dopt->cipso =3D =
dopt->optlen+sizeof(struct iphdr);
11a03f78fbf15a Paul Moore               2006-08-03  178  		memcpy(dptr, spt=
r+sopt->cipso, optlen);
11a03f78fbf15a Paul Moore               2006-08-03  179  		dptr +=3D optlen;
11a03f78fbf15a Paul Moore               2006-08-03  180  		dopt->optlen +=
=3D optlen;
11a03f78fbf15a Paul Moore               2006-08-03  181  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  182  	while (dopt->optl=
en & 3) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  183  		*dptr++ =3D IPOP=
T_END;
^1da177e4c3f41 Linus Torvalds           2005-04-16  184  		dopt->optlen++;
^1da177e4c3f41 Linus Torvalds           2005-04-16  185  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  186  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  187  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  188  =


:::::: The code at line 154 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6553662234035688798==--

