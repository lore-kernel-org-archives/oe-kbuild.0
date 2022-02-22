Content-Type: multipart/mixed; boundary="===============1963449939286601109=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/5] mm/slab: Do not call kmalloc_large() for unsupported size
Date: Tue, 22 Feb 2022 15:53:42 +0800
Message-ID: <202202221538.EHaGbteQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1963449939286601109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220221105336.522086-4-42.hyeyoo@gmail.com>
References: <20220221105336.522086-4-42.hyeyoo@gmail.com>
TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
TO: linux-mm(a)kvack.org
CC: Roman Gushchin <guro@fb.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: linux-kernel(a)vger.kernel.org
CC: Joonsoo Kim <iamjoonsoo.kim@lge.com>
CC: David Rientjes <rientjes@google.com>
CC: Christoph Lameter <cl@linux-foundation.org>
CC: Pekka Enberg <penberg@kernel.org>
CC: Hyeonggon Yoo <42.hyeyoo@gmail.com>

Hi Hyeonggon,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]
[also build test WARNING on linus/master v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hyeonggon-Yoo/slab-cleanup=
s/20220221-185522
base:   https://github.com/hnaz/linux-mm master
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-m001-20220221 (https://download.01.org/0day-ci/ar=
chive/20220222/202202221538.EHaGbteQ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/ubifs/debug.c:2043 check_leaf() warn: is 'node' large enough for 'struct=
 ubifs_ch'? s32min
fs/ubifs/debug.c:2072 check_leaf() warn: is 'node' large enough for 'struct=
 ubifs_data_node'? s32min
fs/ubifs/debug.c:2094 check_leaf() warn: is 'node' large enough for 'struct=
 ubifs_dent_node'? s32min

vim +2043 fs/ubifs/debug.c

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1980  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1981  /**
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1982   * check_leaf - check l=
eaf node.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1983   * @c: UBIFS file-syste=
m description object
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1984   * @zbr: zbranch of the=
 leaf node to check
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1985   * @priv: FS checking i=
nformation
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1986   *
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1987   * This is a helper fun=
ction for 'dbg_check_filesystem()' which is called for
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1988   * every single leaf no=
de while walking the indexing tree. It checks that the
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1989   * leaf node referred f=
rom the indexing tree exists, has correct CRC, and does
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1990   * some other basic val=
idation. This function is also responsible for building
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1991   * an RB-tree of inodes=
 - it adds all inodes into the RB-tree. It also
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1992   * calculates reference=
 count, size, etc for each inode in order to later
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1993   * compare them to the =
information stored inside the inodes and detect possible
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1994   * inconsistencies. Ret=
urns zero in case of success and a negative error code
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1995   * in case of failure.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1996   */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1997  static int check_leaf(s=
truct ubifs_info *c, struct ubifs_zbranch *zbr,
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1998  		      void *priv)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1999  {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2000  	ino_t inum;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2001  	void *node;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2002  	struct ubifs_ch *ch;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2003  	int err, type =3D key_=
type(c, &zbr->key);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2004  	struct fsck_inode *fsc=
ki;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2005  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2006  	if (zbr->len < UBIFS_C=
H_SZ) {
235c362bd0f6af Sheng Yong         2015-03-20  2007  		ubifs_err(c, "bad lea=
f length %d (LEB %d:%d)",
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2008  			  zbr->len, zbr->lnu=
m, zbr->offs);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2009  		return -EINVAL;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2010  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2011  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2012  	node =3D kmalloc(zbr->=
len, GFP_NOFS);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2013  	if (!node)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2014  		return -ENOMEM;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2015  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2016  	err =3D ubifs_tnc_read=
_node(c, zbr, node);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2017  	if (err) {
235c362bd0f6af Sheng Yong         2015-03-20  2018  		ubifs_err(c, "cannot =
read leaf node at LEB %d:%d, error %d",
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2019  			  zbr->lnum, zbr->of=
fs, err);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2020  		goto out_free;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2021  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2022  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2023  	/* If this is an inode=
 node, add it to RB-tree of inodes */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2024  	if (type =3D=3D UBIFS_=
INO_KEY) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2025  		fscki =3D add_inode(c=
, priv, node);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2026  		if (IS_ERR(fscki)) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2027  			err =3D PTR_ERR(fsck=
i);
235c362bd0f6af Sheng Yong         2015-03-20  2028  			ubifs_err(c, "error =
%d while adding inode node", err);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2029  			goto out_dump;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2030  		}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2031  		goto out;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2032  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2033  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2034  	if (type !=3D UBIFS_DE=
NT_KEY && type !=3D UBIFS_XENT_KEY &&
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2035  	    type !=3D UBIFS_DA=
TA_KEY) {
235c362bd0f6af Sheng Yong         2015-03-20  2036  		ubifs_err(c, "unexpec=
ted node type %d at LEB %d:%d",
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2037  			  type, zbr->lnum, z=
br->offs);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2038  		err =3D -EINVAL;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2039  		goto out_free;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2040  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2041  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2042  	ch =3D node;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @2043  	if (le64_to_cpu(ch->sq=
num) > c->max_sqnum) {
235c362bd0f6af Sheng Yong         2015-03-20  2044  		ubifs_err(c, "too hig=
h sequence number, max. is %llu",
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2045  			  c->max_sqnum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2046  		err =3D -EINVAL;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2047  		goto out_dump;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2048  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2049  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2050  	if (type =3D=3D UBIFS_=
DATA_KEY) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2051  		long long blk_offs;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2052  		struct ubifs_data_nod=
e *dn =3D node;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2053  =

6eb61d587f4515 Richard Weinberger 2018-07-12  2054  		ubifs_assert(c, zbr->=
len >=3D UBIFS_DATA_NODE_SZ);
fb4325a3d9f983 Artem Bityutskiy   2014-11-25  2055  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2056  		/*
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2057  		 * Search the inode n=
ode this data node belongs to and insert
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2058  		 * it to the RB-tree =
of inodes.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2059  		 */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2060  		inum =3D key_inum_fla=
sh(c, &dn->key);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2061  		fscki =3D read_add_in=
ode(c, priv, inum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2062  		if (IS_ERR(fscki)) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2063  			err =3D PTR_ERR(fsck=
i);
235c362bd0f6af Sheng Yong         2015-03-20  2064  			ubifs_err(c, "error =
%d while processing data node and trying to find inode node %lu",
e84461ad9c4f0f Artem Bityutskiy   2008-10-29  2065  				  err, (unsigned lo=
ng)inum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2066  			goto out_dump;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2067  		}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2068  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2069  		/* Make sure the data=
 node is within inode size */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2070  		blk_offs =3D key_bloc=
k_flash(c, &dn->key);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2071  		blk_offs <<=3D UBIFS_=
BLOCK_SHIFT;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @2072  		blk_offs +=3D le32_to=
_cpu(dn->size);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2073  		if (blk_offs > fscki-=
>size) {
235c362bd0f6af Sheng Yong         2015-03-20  2074  			ubifs_err(c, "data n=
ode at LEB %d:%d is not within inode size %lld",
79fda5179a5227 Artem Bityutskiy   2012-08-27  2075  				  zbr->lnum, zbr->o=
ffs, fscki->size);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2076  			err =3D -EINVAL;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2077  			goto out_dump;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2078  		}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2079  	} else {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2080  		int nlen;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2081  		struct ubifs_dent_nod=
e *dent =3D node;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2082  		struct fsck_inode *fs=
cki1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2083  =

6eb61d587f4515 Richard Weinberger 2018-07-12  2084  		ubifs_assert(c, zbr->=
len >=3D UBIFS_DENT_NODE_SZ);
fb4325a3d9f983 Artem Bityutskiy   2014-11-25  2085  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2086  		err =3D ubifs_validat=
e_entry(c, dent);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2087  		if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2088  			goto out_dump;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2089  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2090  		/*
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2091  		 * Search the inode n=
ode this entry refers to and the parent
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2092  		 * inode node and ins=
ert them to the RB-tree of inodes.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2093  		 */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @2094  		inum =3D le64_to_cpu(=
dent->inum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2095  		fscki =3D read_add_in=
ode(c, priv, inum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2096  		if (IS_ERR(fscki)) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2097  			err =3D PTR_ERR(fsck=
i);
235c362bd0f6af Sheng Yong         2015-03-20  2098  			ubifs_err(c, "error =
%d while processing entry node and trying to find inode node %lu",
e84461ad9c4f0f Artem Bityutskiy   2008-10-29  2099  				  err, (unsigned lo=
ng)inum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2100  			goto out_dump;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2101  		}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2102  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2103  		/* Count how many dir=
entries or xentries refers this inode */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2104  		fscki->references +=
=3D 1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2105  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2106  		inum =3D key_inum_fla=
sh(c, &dent->key);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2107  		fscki1 =3D read_add_i=
node(c, priv, inum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2108  		if (IS_ERR(fscki1)) {
b38882f5c066dc Roel Kluin         2009-12-07  2109  			err =3D PTR_ERR(fsck=
i1);
235c362bd0f6af Sheng Yong         2015-03-20  2110  			ubifs_err(c, "error =
%d while processing entry node and trying to find parent inode node %lu",
e84461ad9c4f0f Artem Bityutskiy   2008-10-29  2111  				  err, (unsigned lo=
ng)inum);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2112  			goto out_dump;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2113  		}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2114  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2115  		nlen =3D le16_to_cpu(=
dent->nlen);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2116  		if (type =3D=3D UBIFS=
_XENT_KEY) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2117  			fscki1->calc_xcnt +=
=3D 1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2118  			fscki1->calc_xsz +=
=3D CALC_DENT_SIZE(nlen);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2119  			fscki1->calc_xsz +=
=3D CALC_XATTR_BYTES(fscki->size);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2120  			fscki1->calc_xnms +=
=3D nlen;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2121  		} else {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2122  			fscki1->calc_sz +=3D=
 CALC_DENT_SIZE(nlen);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2123  			if (dent->type =3D=
=3D UBIFS_ITYPE_DIR)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2124  				fscki1->calc_cnt +=
=3D 1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2125  		}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2126  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2127  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2128  out:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2129  	kfree(node);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2130  	return 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2131  =

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2132  out_dump:
235c362bd0f6af Sheng Yong         2015-03-20  2133  	ubifs_msg(c, "dump of =
node at LEB %d:%d", zbr->lnum, zbr->offs);
a33e30a0e023e9 Zhihao Cheng       2020-06-16  2134  	ubifs_dump_node(c, nod=
e, zbr->len);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2135  out_free:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2136  	kfree(node);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2137  	return err;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2138  }
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  2139  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1963449939286601109==--

