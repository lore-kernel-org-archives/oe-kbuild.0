Content-Type: multipart/mixed; boundary="===============3428812944340857070=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [djwong-xfs:refactor-log-recovery 294/314] fs/xfs/scrub/rtrmap_repair.c:111:16: warning: Argument 'error==0' to function ASSERT is always 0 [constArgument]
Date: Mon, 13 Apr 2020 16:14:41 +0800
Message-ID: <202004131633.zIzz3dmW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3428812944340857070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t refactor-log-recovery
head:   2dcdc305cfc2b8b1beee483cf8ae5c674d9fac86
commit: 9c766c8019d8de7f1a65645f01b179209b3f7b3c [294/314] xfs: online repa=
ir of the realtime rmap btree
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/xfs/scrub/rtrmap_repair.c:111:16: warning: Argument 'error=3D=3D0' to=
 function ASSERT is always 0 [constArgument]
     ASSERT(error =3D=3D 0);
                  ^
   fs/xfs/scrub/rtrmap_repair.c:110:6: note: Assuming that condition 'error=
' is not redundant
    if (error)
        ^
   fs/xfs/scrub/rtrmap_repair.c:111:16: note: Argument 'error=3D=3D0' to fu=
nction ASSERT is always 0
     ASSERT(error =3D=3D 0);
                  ^
   fs/xfs/scrub/rtrmap_repair.c:115:16: warning: Argument 'error=3D=3D0' to=
 function ASSERT is always 0 [constArgument]
     ASSERT(error =3D=3D 0);
                  ^
   fs/xfs/scrub/rtrmap_repair.c:114:6: note: Assuming that condition 'error=
' is not redundant
    if (error)
        ^
   fs/xfs/scrub/rtrmap_repair.c:115:16: note: Argument 'error=3D=3D0' to fu=
nction ASSERT is always 0
     ASSERT(error =3D=3D 0);
                  ^

# https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/comm=
it/?id=3D9c766c8019d8de7f1a65645f01b179209b3f7b3c
git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/d=
jwong/xfs-linux.git
git remote update djwong-xfs
git checkout 9c766c8019d8de7f1a65645f01b179209b3f7b3c
vim +111 fs/xfs/scrub/rtrmap_repair.c

9c766c8019d8de Darrick J. Wong 2020-03-06   88  =

9c766c8019d8de Darrick J. Wong 2020-03-06   89  /* Compare two rtrmapbt ext=
ents. */
9c766c8019d8de Darrick J. Wong 2020-03-06   90  static int
9c766c8019d8de Darrick J. Wong 2020-03-06   91  xrep_rtrmap_extent_cmp(
9c766c8019d8de Darrick J. Wong 2020-03-06   92  	const void			*a,
9c766c8019d8de Darrick J. Wong 2020-03-06   93  	const void			*b)
9c766c8019d8de Darrick J. Wong 2020-03-06   94  {
9c766c8019d8de Darrick J. Wong 2020-03-06   95  	const struct xrep_rtrmap_e=
xtent	*ap =3D a;
9c766c8019d8de Darrick J. Wong 2020-03-06   96  	const struct xrep_rtrmap_e=
xtent	*bp =3D b;
9c766c8019d8de Darrick J. Wong 2020-03-06   97  	struct xfs_rmap_irec		ar =
=3D {
9c766c8019d8de Darrick J. Wong 2020-03-06   98  		.rm_startblock		=3D ap->s=
tartblock,
9c766c8019d8de Darrick J. Wong 2020-03-06   99  		.rm_blockcount		=3D ap->b=
lockcount,
9c766c8019d8de Darrick J. Wong 2020-03-06  100  		.rm_owner		=3D ap->owner,
9c766c8019d8de Darrick J. Wong 2020-03-06  101  	};
9c766c8019d8de Darrick J. Wong 2020-03-06  102  	struct xfs_rmap_irec		br =
=3D {
9c766c8019d8de Darrick J. Wong 2020-03-06  103  		.rm_startblock		=3D bp->s=
tartblock,
9c766c8019d8de Darrick J. Wong 2020-03-06  104  		.rm_blockcount		=3D bp->b=
lockcount,
9c766c8019d8de Darrick J. Wong 2020-03-06  105  		.rm_owner		=3D bp->owner,
9c766c8019d8de Darrick J. Wong 2020-03-06  106  	};
9c766c8019d8de Darrick J. Wong 2020-03-06  107  	int				error;
9c766c8019d8de Darrick J. Wong 2020-03-06  108  =

9c766c8019d8de Darrick J. Wong 2020-03-06  109  	error =3D xfs_rmap_irec_of=
fset_unpack(ap->offset, &ar);
9c766c8019d8de Darrick J. Wong 2020-03-06  110  	if (error)
9c766c8019d8de Darrick J. Wong 2020-03-06 @111  		ASSERT(error =3D=3D 0);
9c766c8019d8de Darrick J. Wong 2020-03-06  112  =

9c766c8019d8de Darrick J. Wong 2020-03-06  113  	error =3D xfs_rmap_irec_of=
fset_unpack(bp->offset, &br);
9c766c8019d8de Darrick J. Wong 2020-03-06  114  	if (error)
9c766c8019d8de Darrick J. Wong 2020-03-06  115  		ASSERT(error =3D=3D 0);
9c766c8019d8de Darrick J. Wong 2020-03-06  116  =

9c766c8019d8de Darrick J. Wong 2020-03-06  117  	return xfs_rmap_compare(&a=
r, &br);
9c766c8019d8de Darrick J. Wong 2020-03-06  118  }
9c766c8019d8de Darrick J. Wong 2020-03-06  119  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3428812944340857070==--

