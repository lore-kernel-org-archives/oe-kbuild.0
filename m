Content-Type: multipart/mixed; boundary="===============7821947528716220824=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-cil-scale-3 29/30] fs/xfs/xfs_log_cil.c:1200:2: warning: Value stored to 'ticket' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 18:26:27 +0800
Message-ID: <202112121820.2m6GVdJw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7821947528716220824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-cil-scale-3
head:   3b5181b310e0f2064f2aafb6143cdb0e920f5858
commit: 68a175316bac0337bbf0b1c29fb10b63e3c00915 [29/30] xfs: xlog_sync() m=
anually adjusts grant head space
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001-20211210 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121820.2m6GVdJw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git=
/commit/?id=3D68a175316bac0337bbf0b1c29fb10b63e3c00915
        git remote add dgc-xfs https://git.kernel.org/pub/scm/linux/kernel/=
git/dgc/linux-xfs.git
        git fetch --no-tags dgc-xfs xfs-cil-scale-3
        git checkout 68a175316bac0337bbf0b1c29fb10b63e3c00915
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           .high =3D (1ULL << 63) | ((__u64) (size) << 20) | (inode),      =
  \
                                                            ^~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/i915/gt/intel_region_lmem.c:83:3: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D init_fake_lmem_bar(mem);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_region_lmem.c:83:3: note: Value stored to =
'ret' is never read
                   ret =3D init_fake_lmem_bar(mem);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/gfs2/file.c:793:3: warning: Value stored to 'pages' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   pages =3D min(pages, nr_dirtied);
                   ^
   fs/gfs2/file.c:793:3: note: Value stored to 'pages' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/xfs/xfs_log.c:1004:2: warning: Value stored to 'error' is never read =
[clang-analyzer-deadcode.DeadStores]
           error =3D xlog_force_iclog(iclog);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:1004:2: note: Value stored to 'error' is never read
           error =3D xlog_force_iclog(iclog);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:3662:2: warning: Value stored to 'p' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           p =3D &iclog->ic_header;
           ^   ~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:3662:2: note: Value stored to 'p' is never read
           p =3D &iclog->ic_header;
           ^   ~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:3672:2: warning: Value stored to 'ophead' is never read=
 [clang-analyzer-deadcode.DeadStores]
           ophead =3D ptr;
           ^        ~~~
   fs/xfs/xfs_log.c:3672:2: note: Value stored to 'ophead' is never read
           ophead =3D ptr;
           ^        ~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/xfs/xfs_log_cil.c:1200:2: warning: Value stored to 'ticket' is never =
read [clang-analyzer-deadcode.DeadStores]
           ticket =3D ctx->ticket;
           ^        ~~~~~~~~~~~
   fs/xfs/xfs_log_cil.c:1200:2: note: Value stored to 'ticket' is never read
           ticket =3D ctx->ticket;
           ^        ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/btrfs/free-space-tree.c:1454:3: warning: Value stored to 'total_found=
' is never read [clang-analyzer-deadcode.DeadStores]
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/btrfs/free-space-tree.c:1454:3: note: Value stored to 'total_found' i=
s never read
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/btrfs/space-info.c:1544:3: warning: Value stored to 'used' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   fs/btrfs/space-info.c:1544:3: note: Value stored to 'used' is never read
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/btrfs/block-rsv.c:114:3: warning: Value stored to 'qgroup_to_release'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   qgroup_to_release =3D block_rsv->qgroup_rsv_size;
                   ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-rsv.c:114:3: note: Value stored to 'qgroup_to_release' is=
 never read
                   qgroup_to_release =3D block_rsv->qgroup_rsv_size;
                   ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/dac/ad7303.c:37:8: warning: Excessive padding in 'struct ad7=
303_state' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   data, =

   config, =

   spi, =

   vdd_reg, =

   vref_reg, =

   lock, =

   dac_cache, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7303_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad7303.c:37:8: note: Excessive padding in 'struct ad7303=
_state' (86 padding bytes, where 22 is optimal). Optimal fields order: data=
, config, spi, vdd_reg, vref_reg, lock, dac_cache, consider reordering the =
fields or adding explicit padding members
   struct ad7303_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ticket +1200 fs/xfs/xfs_log_cil.c

12cbf4e77f00dd Dave Chinner      2021-12-09   998  =

71e330b593905e Dave Chinner      2010-05-21   999  /*
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1000   * Push the Committed It=
em List to the log.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1001   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1002   * If the current sequen=
ce is the same as xc_push_seq we need to do a flush. If
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1003   * xc_push_seq is less t=
han the current sequence, then it has already been
a44f13edf0ebb4 Dave Chinner      2010-08-24  1004   * flushed and we don't =
need to do anything - the caller will wait for it to
a44f13edf0ebb4 Dave Chinner      2010-08-24  1005   * complete if necessary.
a44f13edf0ebb4 Dave Chinner      2010-08-24  1006   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1007   * xc_push_seq is checke=
d unlocked against the sequence number for a match.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1008   * Hence we can allow lo=
g forces to run racily and not issue pushes for the
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1009   * same sequence twice. =
 If we get a race between multiple pushes for the same
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1010   * sequence they will bl=
ock on the first one and then abort, hence avoiding
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1011   * needless pushes.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1012   */
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1013  static void
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1014  xlog_cil_push_work(
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1015  	struct work_struct	*wor=
k)
71e330b593905e Dave Chinner      2010-05-21  1016  {
39823d0fac9416 Dave Chinner      2021-08-10  1017  	struct xfs_cil_ctx	*ctx=
 =3D
39823d0fac9416 Dave Chinner      2021-08-10  1018  		container_of(work, str=
uct xfs_cil_ctx, push_work);
39823d0fac9416 Dave Chinner      2021-08-10  1019  	struct xfs_cil		*cil =
=3D ctx->cil;
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1020  	struct xlog		*log =3D c=
il->xc_log;
71e330b593905e Dave Chinner      2010-05-21  1021  	struct xfs_log_vec	*lv;
71e330b593905e Dave Chinner      2010-05-21  1022  	struct xfs_cil_ctx	*new=
_ctx;
6f186adfd5efa5 Dave Chinner      2021-12-09  1023  	int			num_iovecs =3D 0;
6f186adfd5efa5 Dave Chinner      2021-12-09  1024  	int			num_bytes =3D 0;
71e330b593905e Dave Chinner      2010-05-21  1025  	int			error =3D 0;
06825339535768 Dave Chinner      2021-12-09  1026  	struct xlog_cil_trans_h=
dr thdr;
aaae3238d5a91e Dave Chinner      2021-12-09  1027  	struct xfs_log_vec	lvhd=
r =3D {};
0dc8f7f139f07a Dave Chinner      2021-07-27  1028  	xfs_lsn_t		preflush_tai=
l_lsn;
0dc8f7f139f07a Dave Chinner      2021-07-27  1029  	xfs_csn_t		push_seq;
bad77c375e8de6 Dave Chinner      2021-06-18  1030  	struct bio		bio;
bad77c375e8de6 Dave Chinner      2021-06-18  1031  	DECLARE_COMPLETION_ONST=
ACK(bdev_flush);
0020a190cf3eac Dave Chinner      2021-08-10  1032  	bool			push_commit_stab=
le;
68a175316bac03 Dave Chinner      2021-12-09  1033  	struct xlog_ticket	*tic=
ket;
71e330b593905e Dave Chinner      2010-05-21  1034  =

39823d0fac9416 Dave Chinner      2021-08-10  1035  	new_ctx =3D xlog_cil_ct=
x_alloc();
71e330b593905e Dave Chinner      2010-05-21  1036  	new_ctx->ticket =3D xlo=
g_cil_ticket_alloc(log);
71e330b593905e Dave Chinner      2010-05-21  1037  =

71e330b593905e Dave Chinner      2010-05-21  1038  	down_write(&cil->xc_ctx=
_lock);
71e330b593905e Dave Chinner      2010-05-21  1039  =

4bb928cdb900d0 Dave Chinner      2013-08-12  1040  	spin_lock(&cil->xc_push=
_lock);
4c2d542f2e7865 Dave Chinner      2012-04-23  1041  	push_seq =3D cil->xc_pu=
sh_seq;
4c2d542f2e7865 Dave Chinner      2012-04-23  1042  	ASSERT(push_seq <=3D ct=
x->sequence);
0020a190cf3eac Dave Chinner      2021-08-10  1043  	push_commit_stable =3D =
cil->xc_push_commit_stable;
0020a190cf3eac Dave Chinner      2021-08-10  1044  	cil->xc_push_commit_sta=
ble =3D false;
71e330b593905e Dave Chinner      2010-05-21  1045  =

0e7ab7efe77451 Dave Chinner      2020-03-24  1046  	/*
19f4e7cc819771 Dave Chinner      2021-06-18  1047  	 * As we are about to s=
witch to a new, empty CIL context, we no longer
19f4e7cc819771 Dave Chinner      2021-06-18  1048  	 * need to throttle tas=
ks on CIL space overruns. Wake any waiters that
19f4e7cc819771 Dave Chinner      2021-06-18  1049  	 * the hard push thrott=
le may have caught so they can start committing
19f4e7cc819771 Dave Chinner      2021-06-18  1050  	 * to the new context. =
The ctx->xc_push_lock provides the serialisation
19f4e7cc819771 Dave Chinner      2021-06-18  1051  	 * necessary for safely=
 using the lockless waitqueue_active() check in
19f4e7cc819771 Dave Chinner      2021-06-18  1052  	 * this context.
19f4e7cc819771 Dave Chinner      2021-06-18  1053  	 */
19f4e7cc819771 Dave Chinner      2021-06-18  1054  	if (waitqueue_active(&c=
il->xc_push_wait))
c7f87f3984cfa1 Dave Chinner      2020-06-16  1055  		wake_up_all(&cil->xc_p=
ush_wait);
0e7ab7efe77451 Dave Chinner      2020-03-24  1056  =

4c2d542f2e7865 Dave Chinner      2012-04-23  1057  	/*
4c2d542f2e7865 Dave Chinner      2012-04-23  1058  	 * Check if we've anyth=
ing to push. If there is nothing, then we don't
4c2d542f2e7865 Dave Chinner      2012-04-23  1059  	 * move on to a new seq=
uence number and so we have to be able to push
4c2d542f2e7865 Dave Chinner      2012-04-23  1060  	 * this sequence again =
later.
4c2d542f2e7865 Dave Chinner      2012-04-23  1061  	 */
5c52eacb2b4420 Dave Chinner      2021-12-09  1062  	if (test_bit(XLOG_CIL_E=
MPTY, &cil->xc_flags)) {
4c2d542f2e7865 Dave Chinner      2012-04-23  1063  		cil->xc_push_seq =3D 0;
4bb928cdb900d0 Dave Chinner      2013-08-12  1064  		spin_unlock(&cil->xc_p=
ush_lock);
a44f13edf0ebb4 Dave Chinner      2010-08-24  1065  		goto out_skip;
4c2d542f2e7865 Dave Chinner      2012-04-23  1066  	}
4c2d542f2e7865 Dave Chinner      2012-04-23  1067  =

a44f13edf0ebb4 Dave Chinner      2010-08-24  1068  =

cf085a1b5d2214 Joe Perches       2019-11-07  1069  	/* check for a previous=
ly pushed sequence */
39823d0fac9416 Dave Chinner      2021-08-10  1070  	if (push_seq < ctx->seq=
uence) {
8af3dcd3c89aef Dave Chinner      2014-09-23  1071  		spin_unlock(&cil->xc_p=
ush_lock);
df806158b0f6eb Dave Chinner      2010-05-17  1072  		goto out_skip;
8af3dcd3c89aef Dave Chinner      2014-09-23  1073  	}
8af3dcd3c89aef Dave Chinner      2014-09-23  1074  =

8af3dcd3c89aef Dave Chinner      2014-09-23  1075  	/*
8af3dcd3c89aef Dave Chinner      2014-09-23  1076  	 * We are now going to =
push this context, so add it to the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  1077  	 * list before we do an=
ything else. This ensures that anyone waiting on
8af3dcd3c89aef Dave Chinner      2014-09-23  1078  	 * this push can easily=
 detect the difference between a "push in
8af3dcd3c89aef Dave Chinner      2014-09-23  1079  	 * progress" and "CIL i=
s empty, nothing to do".
8af3dcd3c89aef Dave Chinner      2014-09-23  1080  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  1081  	 * IOWs, a wait loop ca=
n now check for:
8af3dcd3c89aef Dave Chinner      2014-09-23  1082  	 *	the current sequence=
 not being found on the committing list;
8af3dcd3c89aef Dave Chinner      2014-09-23  1083  	 *	an empty CIL; and
8af3dcd3c89aef Dave Chinner      2014-09-23  1084  	 *	an unchanged sequenc=
e number
8af3dcd3c89aef Dave Chinner      2014-09-23  1085  	 * to detect a push tha=
t had nothing to do and therefore does not need
8af3dcd3c89aef Dave Chinner      2014-09-23  1086  	 * waiting on. If the C=
IL is not empty, we get put on the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  1087  	 * list before emptying=
 the CIL and bumping the sequence number. Hence
8af3dcd3c89aef Dave Chinner      2014-09-23  1088  	 * an empty CIL and an =
unchanged sequence number means we jumped out
8af3dcd3c89aef Dave Chinner      2014-09-23  1089  	 * above after doing no=
thing.
8af3dcd3c89aef Dave Chinner      2014-09-23  1090  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  1091  	 * Hence the waiter wil=
l either find the commit sequence on the
8af3dcd3c89aef Dave Chinner      2014-09-23  1092  	 * committing list or t=
he sequence number will be unchanged and the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  1093  	 * still dirty. In that=
 latter case, the push has not yet started, and
8af3dcd3c89aef Dave Chinner      2014-09-23  1094  	 * so the waiter will h=
ave to continue trying to check the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  1095  	 * committing list unti=
l it is found. In extreme cases of delay, the
8af3dcd3c89aef Dave Chinner      2014-09-23  1096  	 * sequence may fully c=
ommit between the attempts the wait makes to wait
8af3dcd3c89aef Dave Chinner      2014-09-23  1097  	 * on the commit sequen=
ce.
8af3dcd3c89aef Dave Chinner      2014-09-23  1098  	 */
8af3dcd3c89aef Dave Chinner      2014-09-23  1099  	list_add(&ctx->committi=
ng, &cil->xc_committing);
8af3dcd3c89aef Dave Chinner      2014-09-23  1100  	spin_unlock(&cil->xc_pu=
sh_lock);
df806158b0f6eb Dave Chinner      2010-05-17  1101  =

71e330b593905e Dave Chinner      2010-05-21  1102  	/*
bad77c375e8de6 Dave Chinner      2021-06-18  1103  	 * The CIL is stable at=
 this point - nothing new will be added to it
bad77c375e8de6 Dave Chinner      2021-06-18  1104  	 * because we hold the =
flush lock exclusively. Hence we can now issue
bad77c375e8de6 Dave Chinner      2021-06-18  1105  	 * a cache flush to ens=
ure all the completed metadata in the journal we
bad77c375e8de6 Dave Chinner      2021-06-18  1106  	 * are about to overwri=
te is on stable storage.
0dc8f7f139f07a Dave Chinner      2021-07-27  1107  	 *
0dc8f7f139f07a Dave Chinner      2021-07-27  1108  	 * Because we are issui=
ng this cache flush before we've written the
0dc8f7f139f07a Dave Chinner      2021-07-27  1109  	 * tail lsn to the iclo=
g, we can have metadata IO completions move the
0dc8f7f139f07a Dave Chinner      2021-07-27  1110  	 * tail forwards betwee=
n the completion of this flush and the iclog
0dc8f7f139f07a Dave Chinner      2021-07-27  1111  	 * being written. In th=
is case, we need to re-issue the cache flush
0dc8f7f139f07a Dave Chinner      2021-07-27  1112  	 * before the iclog wri=
te. To detect whether the log tail moves, sample
0dc8f7f139f07a Dave Chinner      2021-07-27  1113  	 * the tail LSN *before=
* we issue the flush.
0dc8f7f139f07a Dave Chinner      2021-07-27  1114  	 */
0dc8f7f139f07a Dave Chinner      2021-07-27  1115  	preflush_tail_lsn =3D a=
tomic64_read(&log->l_tail_lsn);
bad77c375e8de6 Dave Chinner      2021-06-18  1116  	xfs_flush_bdev_async(&b=
io, log->l_mp->m_ddev_targp->bt_bdev,
bad77c375e8de6 Dave Chinner      2021-06-18  1117  				&bdev_flush);
bad77c375e8de6 Dave Chinner      2021-06-18  1118  =

783bf145877323 Dave Chinner      2021-12-09  1119  	xlog_cil_pcp_aggregate(=
cil, ctx);
783bf145877323 Dave Chinner      2021-12-09  1120  =

692a45164049bb Dave Chinner      2021-12-09  1121  	while (!list_empty(&ctx=
->log_items)) {
71e330b593905e Dave Chinner      2010-05-21  1122  		struct xfs_log_item	*i=
tem;
71e330b593905e Dave Chinner      2010-05-21  1123  =

692a45164049bb Dave Chinner      2021-12-09  1124  		item =3D list_first_en=
try(&ctx->log_items,
71e330b593905e Dave Chinner      2010-05-21  1125  					struct xfs_log_item=
, li_cil);
aaae3238d5a91e Dave Chinner      2021-12-09  1126  		lv =3D item->li_lv;
988009101d40bb Dave Chinner      2021-12-09  1127  		lv->lv_order_id =3D it=
em->li_order_id;
aaae3238d5a91e Dave Chinner      2021-12-09  1128  		num_iovecs +=3D lv->lv=
_niovecs;
6f186adfd5efa5 Dave Chinner      2021-12-09  1129  		/* we don't write orde=
red log vectors */
6f186adfd5efa5 Dave Chinner      2021-12-09  1130  		if (lv->lv_buf_len !=
=3D XFS_LOG_VEC_ORDERED)
6f186adfd5efa5 Dave Chinner      2021-12-09  1131  			num_bytes +=3D lv->lv=
_bytes;
aaae3238d5a91e Dave Chinner      2021-12-09  1132  =

aaae3238d5a91e Dave Chinner      2021-12-09  1133  		list_add_tail(&lv->lv_=
list, &ctx->lv_chain);
988009101d40bb Dave Chinner      2021-12-09  1134  		list_del_init(&item->l=
i_cil);
988009101d40bb Dave Chinner      2021-12-09  1135  		item->li_order_id =3D =
0;
988009101d40bb Dave Chinner      2021-12-09  1136  		item->li_lv =3D NULL;
71e330b593905e Dave Chinner      2010-05-21  1137  	}
71e330b593905e Dave Chinner      2010-05-21  1138  =

71e330b593905e Dave Chinner      2010-05-21  1139  	/*
39823d0fac9416 Dave Chinner      2021-08-10  1140  	 * Switch the contexts =
so we can drop the context lock and move out
71e330b593905e Dave Chinner      2010-05-21  1141  	 * of a shared context.=
 We can't just go straight to the commit record,
71e330b593905e Dave Chinner      2010-05-21  1142  	 * though - we need to =
synchronise with previous and future commits so
71e330b593905e Dave Chinner      2010-05-21  1143  	 * that the commit reco=
rds are correctly ordered in the log to ensure
71e330b593905e Dave Chinner      2010-05-21  1144  	 * that we process item=
s during log IO completion in the correct order.
71e330b593905e Dave Chinner      2010-05-21  1145  	 *
71e330b593905e Dave Chinner      2010-05-21  1146  	 * For example, if we g=
et an EFI in one checkpoint and the EFD in the
71e330b593905e Dave Chinner      2010-05-21  1147  	 * next (e.g. due to lo=
g forces), we do not want the checkpoint with
71e330b593905e Dave Chinner      2010-05-21  1148  	 * the EFD to be commit=
ted before the checkpoint with the EFI.  Hence
71e330b593905e Dave Chinner      2010-05-21  1149  	 * we must strictly ord=
er the commit records of the checkpoints so
71e330b593905e Dave Chinner      2010-05-21  1150  	 * that: a) the checkpo=
int callbacks are attached to the iclogs in the
71e330b593905e Dave Chinner      2010-05-21  1151  	 * correct order; and b=
) the checkpoints are replayed in correct order
71e330b593905e Dave Chinner      2010-05-21  1152  	 * in log recovery.
71e330b593905e Dave Chinner      2010-05-21  1153  	 *
71e330b593905e Dave Chinner      2010-05-21  1154  	 * Hence we need to add=
 this context to the committing context list so
71e330b593905e Dave Chinner      2010-05-21  1155  	 * that higher sequence=
s will wait for us to write out a commit record
71e330b593905e Dave Chinner      2010-05-21  1156  	 * before they do.
f876e44603ad09 Dave Chinner      2014-02-27  1157  	 *
5f9b4b0de8dc2f Dave Chinner      2021-06-18  1158  	 * xfs_log_force_seq re=
quires us to mirror the new sequence into the cil
f876e44603ad09 Dave Chinner      2014-02-27  1159  	 * structure atomically=
 with the addition of this sequence to the
f876e44603ad09 Dave Chinner      2014-02-27  1160  	 * committing list. Thi=
s also ensures that we can do unlocked checks
f876e44603ad09 Dave Chinner      2014-02-27  1161  	 * against the current =
sequence in log forces without risking
f876e44603ad09 Dave Chinner      2014-02-27  1162  	 * deferencing a freed =
context pointer.
71e330b593905e Dave Chinner      2010-05-21  1163  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  1164  	spin_lock(&cil->xc_push=
_lock);
39823d0fac9416 Dave Chinner      2021-08-10  1165  	xlog_cil_ctx_switch(cil=
, new_ctx);
4bb928cdb900d0 Dave Chinner      2013-08-12  1166  	spin_unlock(&cil->xc_pu=
sh_lock);
71e330b593905e Dave Chinner      2010-05-21  1167  	up_write(&cil->xc_ctx_l=
ock);
71e330b593905e Dave Chinner      2010-05-21  1168  =

988009101d40bb Dave Chinner      2021-12-09  1169  	/*
988009101d40bb Dave Chinner      2021-12-09  1170  	 * Sort the log vector =
chain before we add the transaction headers.
988009101d40bb Dave Chinner      2021-12-09  1171  	 * This ensures we alwa=
ys have the transaction headers at the start
988009101d40bb Dave Chinner      2021-12-09  1172  	 * of the chain.
988009101d40bb Dave Chinner      2021-12-09  1173  	 */
988009101d40bb Dave Chinner      2021-12-09  1174  	list_sort(NULL, &ctx->l=
v_chain, xlog_cil_order_cmp);
988009101d40bb Dave Chinner      2021-12-09  1175  =

71e330b593905e Dave Chinner      2010-05-21  1176  	/*
71e330b593905e Dave Chinner      2010-05-21  1177  	 * Build a checkpoint t=
ransaction header and write it to the log to
71e330b593905e Dave Chinner      2010-05-21  1178  	 * begin the transactio=
n. We need to account for the space used by the
71e330b593905e Dave Chinner      2010-05-21  1179  	 * transaction header h=
ere as it is not accounted for in xlog_write().
aaae3238d5a91e Dave Chinner      2021-12-09  1180  	 * Add the lvhdr to the=
 head of the lv chain we pass to xlog_write() so
aaae3238d5a91e Dave Chinner      2021-12-09  1181  	 * it gets written into=
 the iclog first.
71e330b593905e Dave Chinner      2010-05-21  1182  	 */
06825339535768 Dave Chinner      2021-12-09  1183  	xlog_cil_build_trans_hd=
r(ctx, &thdr, &lvhdr, num_iovecs);
6f186adfd5efa5 Dave Chinner      2021-12-09  1184  	num_bytes +=3D lvhdr.lv=
_bytes;
aaae3238d5a91e Dave Chinner      2021-12-09  1185  	list_add(&lvhdr.lv_list=
, &ctx->lv_chain);
71e330b593905e Dave Chinner      2010-05-21  1186  =

bad77c375e8de6 Dave Chinner      2021-06-18  1187  	/*
bad77c375e8de6 Dave Chinner      2021-06-18  1188  	 * Before we format and=
 submit the first iclog, we have to ensure that
bad77c375e8de6 Dave Chinner      2021-06-18  1189  	 * the metadata writeba=
ck ordering cache flush is complete.
bad77c375e8de6 Dave Chinner      2021-06-18  1190  	 */
bad77c375e8de6 Dave Chinner      2021-06-18  1191  	wait_for_completion(&bd=
ev_flush);
bad77c375e8de6 Dave Chinner      2021-06-18  1192  =

68a175316bac03 Dave Chinner      2021-12-09  1193  	/*
68a175316bac03 Dave Chinner      2021-12-09  1194  	 * Grab the ticket from=
 the ctx so we can ungrant it after releasing the
68a175316bac03 Dave Chinner      2021-12-09  1195  	 * commit_iclog. The ct=
x may be freed by the time we return from
68a175316bac03 Dave Chinner      2021-12-09  1196  	 * releasing the commit=
_iclog (i.e. checkpoint has been completed and
68a175316bac03 Dave Chinner      2021-12-09  1197  	 * callback run) so we =
can't reference the ctx after the call to
68a175316bac03 Dave Chinner      2021-12-09  1198  	 * xlog_state_release_i=
clog().
68a175316bac03 Dave Chinner      2021-12-09  1199  	 */
68a175316bac03 Dave Chinner      2021-12-09 @1200  	ticket =3D ctx->ticket;
68a175316bac03 Dave Chinner      2021-12-09  1201  =

aaae3238d5a91e Dave Chinner      2021-12-09  1202  	/*
aaae3238d5a91e Dave Chinner      2021-12-09  1203  	 * Take the lvhdr back =
off the lv_chain immediately after calling
aaae3238d5a91e Dave Chinner      2021-12-09  1204  	 * xlog_cil_write_chain=
() as it should not be passed to log IO
aaae3238d5a91e Dave Chinner      2021-12-09  1205  	 * completion.
aaae3238d5a91e Dave Chinner      2021-12-09  1206  	 */
aaae3238d5a91e Dave Chinner      2021-12-09  1207  	error =3D xlog_cil_writ=
e_chain(ctx, num_bytes);
aaae3238d5a91e Dave Chinner      2021-12-09  1208  	list_del(&lvhdr.lv_list=
);
bf034bc827807a Dave Chinner      2021-08-10  1209  	if (error)
ac983517ec5941 Dave Chinner      2014-05-07  1210  		goto out_abort_free_ti=
cket;
71e330b593905e Dave Chinner      2010-05-21  1211  =

caa80090d17c89 Dave Chinner      2021-08-10  1212  	error =3D xlog_cil_writ=
e_commit_record(ctx);
dd401770b0ff68 Dave Chinner      2020-03-25  1213  	if (error)
dd401770b0ff68 Dave Chinner      2020-03-25  1214  		goto out_abort_free_ti=
cket;
dd401770b0ff68 Dave Chinner      2020-03-25  1215  =

a79b28c284fd91 Dave Chinner      2021-06-18  1216  	/*
1effb72a8179a0 Dave Chinner      2021-06-25  1217  	 * If the checkpoint sp=
ans multiple iclogs, wait for all previous iclogs
1effb72a8179a0 Dave Chinner      2021-06-25  1218  	 * to complete before w=
e submit the commit_iclog. We can't use state
1effb72a8179a0 Dave Chinner      2021-06-25  1219  	 * checks for this - AC=
TIVE can be either a past completed iclog or a
1effb72a8179a0 Dave Chinner      2021-06-25  1220  	 * future iclog being f=
illed, while WANT_SYNC through SYNC_DONE can be a
1effb72a8179a0 Dave Chinner      2021-06-25  1221  	 * past or future iclog=
 awaiting IO or ordered IO completion to be run.
1effb72a8179a0 Dave Chinner      2021-06-25  1222  	 * In the latter case, =
if it's a future iclog and we wait on it, the we
1effb72a8179a0 Dave Chinner      2021-06-25  1223  	 * will hang because it=
 won't get processed through to ic_force_wait
1effb72a8179a0 Dave Chinner      2021-06-25  1224  	 * wakeup until this co=
mmit_iclog is written to disk.  Hence we use the
1effb72a8179a0 Dave Chinner      2021-06-25  1225  	 * iclog header lsn and=
 compare it to the commit lsn to determine if we
1effb72a8179a0 Dave Chinner      2021-06-25  1226  	 * need to wait on iclo=
gs or not.
a79b28c284fd91 Dave Chinner      2021-06-18  1227  	 */
caa80090d17c89 Dave Chinner      2021-08-10  1228  	spin_lock(&log->l_iclog=
lock);
c45aba40cf5b29 Dave Chinner      2021-08-10  1229  	if (ctx->start_lsn !=3D=
 ctx->commit_lsn) {
1effb72a8179a0 Dave Chinner      2021-06-25  1230  		xfs_lsn_t	plsn;
1effb72a8179a0 Dave Chinner      2021-06-25  1231  =

caa80090d17c89 Dave Chinner      2021-08-10  1232  		plsn =3D be64_to_cpu(c=
tx->commit_iclog->ic_prev->ic_header.h_lsn);
c45aba40cf5b29 Dave Chinner      2021-08-10  1233  		if (plsn && XFS_LSN_CM=
P(plsn, ctx->commit_lsn) < 0) {
1effb72a8179a0 Dave Chinner      2021-06-25  1234  			/*
1effb72a8179a0 Dave Chinner      2021-06-25  1235  			 * Waiting on ic_forc=
e_wait orders the completion of
1effb72a8179a0 Dave Chinner      2021-06-25  1236  			 * iclogs older than =
ic_prev. Hence we only need to wait
1effb72a8179a0 Dave Chinner      2021-06-25  1237  			 * on the most recent=
 older iclog here.
1effb72a8179a0 Dave Chinner      2021-06-25  1238  			 */
caa80090d17c89 Dave Chinner      2021-08-10  1239  			xlog_wait_on_iclog(ct=
x->commit_iclog->ic_prev);
eef983ffeae7a1 Dave Chinner      2021-06-18  1240  			spin_lock(&log->l_icl=
oglock);
1effb72a8179a0 Dave Chinner      2021-06-25  1241  		}
1effb72a8179a0 Dave Chinner      2021-06-25  1242  =

1effb72a8179a0 Dave Chinner      2021-06-25  1243  		/*
1effb72a8179a0 Dave Chinner      2021-06-25  1244  		 * We need to issue a =
pre-flush so that the ordering for this
1effb72a8179a0 Dave Chinner      2021-06-25  1245  		 * checkpoint is corre=
ctly preserved down to stable storage.
1effb72a8179a0 Dave Chinner      2021-06-25  1246  		 */
caa80090d17c89 Dave Chinner      2021-08-10  1247  		ctx->commit_iclog->ic_=
flags |=3D XLOG_ICL_NEED_FLUSH;
a79b28c284fd91 Dave Chinner      2021-06-18  1248  	}
a79b28c284fd91 Dave Chinner      2021-06-18  1249  =

eef983ffeae7a1 Dave Chinner      2021-06-18  1250  	/*
eef983ffeae7a1 Dave Chinner      2021-06-18  1251  	 * The commit iclog mus=
t be written to stable storage to guarantee
eef983ffeae7a1 Dave Chinner      2021-06-18  1252  	 * journal IO vs metada=
ta writeback IO is correctly ordered on stable
eef983ffeae7a1 Dave Chinner      2021-06-18  1253  	 * storage.
0020a190cf3eac Dave Chinner      2021-08-10  1254  	 *
0020a190cf3eac Dave Chinner      2021-08-10  1255  	 * If the push caller n=
eeds the commit to be immediately stable and the
0020a190cf3eac Dave Chinner      2021-08-10  1256  	 * commit_iclog is not =
yet marked as XLOG_STATE_WANT_SYNC to indicate it
0020a190cf3eac Dave Chinner      2021-08-10  1257  	 * will be written when=
 released, switch it's state to WANT_SYNC right
0020a190cf3eac Dave Chinner      2021-08-10  1258  	 * now.
eef983ffeae7a1 Dave Chinner      2021-06-18  1259  	 */
caa80090d17c89 Dave Chinner      2021-08-10  1260  	ctx->commit_iclog->ic_f=
lags |=3D XLOG_ICL_NEED_FUA;
0020a190cf3eac Dave Chinner      2021-08-10  1261  	if (push_commit_stable =
&&
0020a190cf3eac Dave Chinner      2021-08-10  1262  	    ctx->commit_iclog->=
ic_state =3D=3D XLOG_STATE_ACTIVE)
0020a190cf3eac Dave Chinner      2021-08-10  1263  		xlog_state_switch_iclo=
gs(log, ctx->commit_iclog, 0);
68a175316bac03 Dave Chinner      2021-12-09  1264  	ticket =3D ctx->ticket;
68a175316bac03 Dave Chinner      2021-12-09  1265  	xlog_state_release_iclo=
g(log, ctx->commit_iclog, ticket,
68a175316bac03 Dave Chinner      2021-12-09  1266  			preflush_tail_lsn);
502a01fac09834 Dave Chinner      2021-08-10  1267  =

502a01fac09834 Dave Chinner      2021-08-10  1268  	/* Not safe to referenc=
e ctx now! */
502a01fac09834 Dave Chinner      2021-08-10  1269  =

eef983ffeae7a1 Dave Chinner      2021-06-18  1270  	spin_unlock(&log->l_icl=
oglock);
68a175316bac03 Dave Chinner      2021-12-09  1271  	xfs_log_ticket_ungrant(=
log, ticket);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1272  	return;
71e330b593905e Dave Chinner      2010-05-21  1273  =

71e330b593905e Dave Chinner      2010-05-21  1274  out_skip:
71e330b593905e Dave Chinner      2010-05-21  1275  	up_write(&cil->xc_ctx_l=
ock);
71e330b593905e Dave Chinner      2010-05-21  1276  	xfs_log_ticket_put(new_=
ctx->ticket);
71e330b593905e Dave Chinner      2010-05-21  1277  	kmem_free(new_ctx);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1278  	return;
71e330b593905e Dave Chinner      2010-05-21  1279  =

7db37c5e6575b2 Dave Chinner      2011-01-27  1280  out_abort_free_ticket:
2039a272300b94 Dave Chinner      2021-08-10  1281  	ASSERT(xlog_is_shutdown=
(log));
caa80090d17c89 Dave Chinner      2021-08-10  1282  	if (!ctx->commit_iclog)=
 {
68a175316bac03 Dave Chinner      2021-12-09  1283  		xfs_log_ticket_ungrant=
(log, ctx->ticket);
12e6a0f449d585 Christoph Hellwig 2020-03-20  1284  		xlog_cil_committed(ctx=
);
caa80090d17c89 Dave Chinner      2021-08-10  1285  		return;
caa80090d17c89 Dave Chinner      2021-08-10  1286  	}
caa80090d17c89 Dave Chinner      2021-08-10  1287  	spin_lock(&log->l_iclog=
lock);
68a175316bac03 Dave Chinner      2021-12-09  1288  	ticket =3D ctx->ticket;
68a175316bac03 Dave Chinner      2021-12-09  1289  	xlog_state_release_iclo=
g(log, ctx->commit_iclog, ticket, 0);
caa80090d17c89 Dave Chinner      2021-08-10  1290  	/* Not safe to referenc=
e ctx now! */
caa80090d17c89 Dave Chinner      2021-08-10  1291  	spin_unlock(&log->l_icl=
oglock);
68a175316bac03 Dave Chinner      2021-12-09  1292  	xfs_log_ticket_ungrant(=
log, ticket);
4c2d542f2e7865 Dave Chinner      2012-04-23  1293  }
4c2d542f2e7865 Dave Chinner      2012-04-23  1294  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7821947528716220824==--

