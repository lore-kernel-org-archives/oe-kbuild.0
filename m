Content-Type: multipart/mixed; boundary="===============1697645419126386674=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-5.19-compose 16/43] fs/xfs/xfs_attr_item.c:401 xfs_attr_create_intent() error: uninitialized symbol 'attrip'.
Date: Sun, 08 May 2022 09:50:23 +0800
Message-ID: <202205080942.rlNJyC8R-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1697645419126386674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-5.19-compose
head:   d8fa98c66946d5b1e01531cf7cb50151817f6894
commit: bec9742ffc23793ecbc7b2d72bb0a85c314b421a [16/43] xfs: Implement att=
r logging and replay
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220508/202205080942.rlNJyC8R-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_attr_item.c:401 xfs_attr_create_intent() error: uninitialized sy=
mbol 'attrip'.

vim +/attrip +401 fs/xfs/xfs_attr_item.c

bec9742ffc2379 Allison Henderson 2022-05-04  369  =

bec9742ffc2379 Allison Henderson 2022-05-04  370  /* Get an ATTRI. */
bec9742ffc2379 Allison Henderson 2022-05-04  371  static struct xfs_log_ite=
m *
bec9742ffc2379 Allison Henderson 2022-05-04  372  xfs_attr_create_intent(
bec9742ffc2379 Allison Henderson 2022-05-04  373  	struct xfs_trans		*tp,
bec9742ffc2379 Allison Henderson 2022-05-04  374  	struct list_head		*items,
bec9742ffc2379 Allison Henderson 2022-05-04  375  	unsigned int			count,
bec9742ffc2379 Allison Henderson 2022-05-04  376  	bool				sort)
bec9742ffc2379 Allison Henderson 2022-05-04  377  {
bec9742ffc2379 Allison Henderson 2022-05-04  378  	struct xfs_mount		*mp =
=3D tp->t_mountp;
bec9742ffc2379 Allison Henderson 2022-05-04  379  	struct xfs_attri_log_ite=
m	*attrip;
bec9742ffc2379 Allison Henderson 2022-05-04  380  	struct xfs_attr_item		*a=
ttr;
bec9742ffc2379 Allison Henderson 2022-05-04  381  =

bec9742ffc2379 Allison Henderson 2022-05-04  382  	ASSERT(count =3D=3D 1);
bec9742ffc2379 Allison Henderson 2022-05-04  383  =

bec9742ffc2379 Allison Henderson 2022-05-04  384  	if (!xfs_sb_version_hasl=
ogxattrs(&mp->m_sb))
bec9742ffc2379 Allison Henderson 2022-05-04  385  		return NULL;
bec9742ffc2379 Allison Henderson 2022-05-04  386  =

bec9742ffc2379 Allison Henderson 2022-05-04  387  	/*
bec9742ffc2379 Allison Henderson 2022-05-04  388  	 * Each attr item only p=
erforms one attribute operation at a time, so
bec9742ffc2379 Allison Henderson 2022-05-04  389  	 * this is a list of one
bec9742ffc2379 Allison Henderson 2022-05-04  390  	 */
bec9742ffc2379 Allison Henderson 2022-05-04  391  	list_for_each_entry(attr=
, items, xattri_list) {
bec9742ffc2379 Allison Henderson 2022-05-04  392  		attrip =3D xfs_attri_in=
it(mp, attr->xattri_dac.da_args->namelen,
bec9742ffc2379 Allison Henderson 2022-05-04  393  					attr->xattri_dac.da_=
args->valuelen);
bec9742ffc2379 Allison Henderson 2022-05-04  394  		if (attrip =3D=3D NULL)
bec9742ffc2379 Allison Henderson 2022-05-04  395  			return NULL;
bec9742ffc2379 Allison Henderson 2022-05-04  396  =

bec9742ffc2379 Allison Henderson 2022-05-04  397  		xfs_trans_add_item(tp, =
&attrip->attri_item);
bec9742ffc2379 Allison Henderson 2022-05-04  398  		xfs_attr_log_item(tp, a=
ttrip, attr);
bec9742ffc2379 Allison Henderson 2022-05-04  399  	}
bec9742ffc2379 Allison Henderson 2022-05-04  400  =

bec9742ffc2379 Allison Henderson 2022-05-04 @401  	return &attrip->attri_it=
em;
bec9742ffc2379 Allison Henderson 2022-05-04  402  }
bec9742ffc2379 Allison Henderson 2022-05-04  403  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1697645419126386674==--

