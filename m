Content-Type: multipart/mixed; boundary="===============5774419216804456861=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ceph-client:wip-fscrypt 29/63] fs/ceph/mds_client.c:3915:19: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 21 Feb 2022 06:35:11 +0800
Message-ID: <202202210649.1D2hrQUz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5774419216804456861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: ceph-devel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://github.com/ceph/ceph-client.git wip-fscrypt
head:   4ec0d0e0cc68c6525ace02e7a8a5bb57a4242997
commit: 16a6682845642c1929a94e826c4426c22ef909d4 [29/63] ceph: add encrypte=
d fname handling to ceph_mdsc_build_path
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20221/202202210649.1D2hrQUz-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ceph/ceph-client/commit/16a6682845642c1929a94e=
826c4426c22ef909d4
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client wip-fscrypt
        git checkout 16a6682845642c1929a94e826c4426c22ef909d4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/notify/fanotify/fanotify_user.c:1598:24: note: Left side of '&&' is f=
alse
           if (mask & FAN_RENAME && !(fid_mode & FAN_REPORT_NAME))
                                 ^
   fs/notify/fanotify/fanotify_user.c:1601:6: note: Assuming the condition =
is false
           if (flags & FAN_MARK_FLUSH) {
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1601:2: note: Taking false branch
           if (flags & FAN_MARK_FLUSH) {
           ^
   fs/notify/fanotify/fanotify_user.c:1614:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/notify/fanotify/fanotify_user.c:1614:2: note: Taking false branch
           if (ret)
           ^
   fs/notify/fanotify/fanotify_user.c:1617:6: note: Assuming the condition =
is false
           if (flags & FAN_MARK_ADD) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1617:2: note: Taking false branch
           if (flags & FAN_MARK_ADD) {
           ^
   fs/notify/fanotify/fanotify_user.c:1623:6: note: Assuming 'fid_mode' is 0
           if (fid_mode) {
               ^~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1623:2: note: Taking false branch
           if (fid_mode) {
           ^
   fs/notify/fanotify/fanotify_user.c:1636:6: note: 'mark_type' is not equa=
l to FAN_MARK_INODE
           if (mark_type =3D=3D FAN_MARK_INODE)
               ^~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1636:2: note: Taking false branch
           if (mark_type =3D=3D FAN_MARK_INODE)
           ^
   fs/notify/fanotify/fanotify_user.c:1642:6: note: Assuming 'mnt' is null
           if (mnt || !S_ISDIR(inode->i_mode)) {
               ^~~
   fs/notify/fanotify/fanotify_user.c:1642:6: note: Left side of '||' is fa=
lse
   fs/notify/fanotify/fanotify_user.c:1642:14: note: Access to field 'i_mod=
e' results in a dereference of a null pointer (loaded from variable 'inode')
           if (mnt || !S_ISDIR(inode->i_mode)) {
                       ^
   include/uapi/linux/stat.h:23:22: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                             ^~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/acpi/power.c:951:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_POWER_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/power.c:951:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_POWER_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/power.c:952:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_POWER_CLASS);
           ^~~~~~
   drivers/acpi/power.c:952:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_POWER_CLASS);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/acpi/event.c:31:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(event.device_class, dev->pnp.device_class);
           ^~~~~~
   drivers/acpi/event.c:31:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(event.device_class, dev->pnp.device_class);
           ^~~~~~
   drivers/acpi/event.c:32:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(event.bus_id, dev->pnp.bus_id);
           ^~~~~~
   drivers/acpi/event.c:32:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(event.bus_id, dev->pnp.bus_id);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/ceph/mds_client.c:518:46: warning: Although the value stored to 'ino'=
 is used in the enclosing expression, the value is never actually read from=
 'ino' [clang-analyzer-deadcode.DeadStores]
                           int err =3D xa_insert(&s->s_delegated_inos, ino =
=3D start++,
                                                                     ^     =
~~~~~~~
   fs/ceph/mds_client.c:518:46: note: Although the value stored to 'ino' is=
 used in the enclosing expression, the value is never actually read from 'i=
no'
                           int err =3D xa_insert(&s->s_delegated_inos, ino =
=3D start++,
                                                                     ^     =
~~~~~~~
   fs/ceph/mds_client.c:1487:2: warning: Value stored to 'mstate' is never =
read [clang-analyzer-deadcode.DeadStores]
           mstate =3D ceph_mdsmap_get_state(mdsc->mdsmap, mds);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:1487:2: note: Value stored to 'mstate' is never read
           mstate =3D ceph_mdsmap_get_state(mdsc->mdsmap, mds);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/mds_client.c:3915:19: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
                   rec.v2.pathbase =3D cpu_to_le64(pathbase);
                                   ^
   fs/ceph/mds_client.c:5269:2: note: Loop condition is false.  Exiting loop
           pr_warn("mds%d closed our session\n", s->s_mds);
           ^
   include/linux/printk.h:499:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/ceph/mds_client.c:5270:2: note: Calling 'send_mds_reconnect'
           send_mds_reconnect(mdsc, s);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4120:2: note: Loop condition is false.  Exiting loop
           pr_info("mds%d reconnect start\n", mds);
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/ceph/mds_client.c:4123:6: note: Assuming field 'pagelist' is non-null
           if (!recon_state.pagelist)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4123:2: note: Taking false branch
           if (!recon_state.pagelist)
           ^
   fs/ceph/mds_client.c:4127:6: note: Assuming 'reply' is non-null
           if (!reply)
               ^~~~~~
   fs/ceph/mds_client.c:4127:2: note: Taking false branch
           if (!reply)
           ^
   fs/ceph/mds_client.c:4136:2: note: Taking false branch
           dout("session %p state %s\n", session,
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/mds_client.c:4156:6: note: Assuming field 's_root' is null
           if (mdsc->fsc->sb->s_root)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4156:2: note: Taking false branch
           if (mdsc->fsc->sb->s_root)
           ^
   fs/ceph/mds_client.c:4173:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/ceph/mds_client.c:4173:2: note: Taking false branch
           if (err)
           ^
   fs/ceph/mds_client.c:4176:6: note: Assuming the condition is false
           if (test_bit(CEPHFS_FEATURE_MULTI_RECONNECT, &session->s_feature=
s)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/ceph/mds_client.c:4176:2: note: Taking false branch
           if (test_bit(CEPHFS_FEATURE_MULTI_RECONNECT, &session->s_feature=
s)) {
           ^
   fs/ceph/mds_client.c:4179:13: note: Assuming the condition is false
           } else if (session->s_con.peer_features & CEPH_FEATURE_MDSENC) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4179:9: note: Taking false branch
           } else if (session->s_con.peer_features & CEPH_FEATURE_MDSENC) {
                  ^
   fs/ceph/mds_client.c:4185:8: note: Calling 'ceph_iterate_session_caps'
           err =3D ceph_iterate_session_caps(session, reconnect_caps_cb, &r=
econ_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   fs/ceph/mds_client.c:1643:2: note: Taking false branch
           dout("iterate_session_caps %p mds%d\n", session, session->s_mds);
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/mds_client.c:1646:2: note: Loop condition is true.  Entering loo=
p body
           while (p !=3D &session->s_caps) {

vim +3915 fs/ceph/mds_client.c

a33f6432b3a63a Yan, Zheng    2020-08-11  3856  =

2f2dc053404feb Sage Weil     2009-10-06  3857  /*
2f2dc053404feb Sage Weil     2009-10-06  3858   * Encode information about =
a cap for a reconnect with the MDS.
2f2dc053404feb Sage Weil     2009-10-06  3859   */
a25949b99003b7 Jeff Layton   2020-02-18  3860  static int reconnect_caps_cb=
(struct inode *inode, struct ceph_cap *cap,
2f2dc053404feb Sage Weil     2009-10-06  3861  			  void *arg)
2f2dc053404feb Sage Weil     2009-10-06  3862  {
20cb34ae9e4b00 Sage Weil     2010-05-12  3863  	union {
20cb34ae9e4b00 Sage Weil     2010-05-12  3864  		struct ceph_mds_cap_reconn=
ect v2;
20cb34ae9e4b00 Sage Weil     2010-05-12  3865  		struct ceph_mds_cap_reconn=
ect_v1 v1;
20cb34ae9e4b00 Sage Weil     2010-05-12  3866  	} rec;
b3f8d68f38a879 Yan, Zheng    2017-09-11  3867  	struct ceph_inode_info *ci =
=3D cap->ci;
20cb34ae9e4b00 Sage Weil     2010-05-12  3868  	struct ceph_reconnect_state=
 *recon_state =3D arg;
20cb34ae9e4b00 Sage Weil     2010-05-12  3869  	struct ceph_pagelist *pagel=
ist =3D recon_state->pagelist;
a33f6432b3a63a Yan, Zheng    2020-08-11  3870  	struct dentry *dentry;
a33f6432b3a63a Yan, Zheng    2020-08-11  3871  	char *path;
ee2a095d3b24f3 Xiubo Li      2021-11-30  3872  	int pathlen =3D 0, err;
a33f6432b3a63a Yan, Zheng    2020-08-11  3873  	u64 pathbase;
3469ed0d149ba7 Yan, Zheng    2016-07-05  3874  	u64 snap_follows;
2f2dc053404feb Sage Weil     2009-10-06  3875  =

2f2dc053404feb Sage Weil     2009-10-06  3876  	dout(" adding %p ino %llx.%=
llx cap %p %lld %s\n",
2f2dc053404feb Sage Weil     2009-10-06  3877  	     inode, ceph_vinop(inod=
e), cap, cap->cap_id,
2f2dc053404feb Sage Weil     2009-10-06  3878  	     ceph_cap_string(cap->i=
ssued));
2f2dc053404feb Sage Weil     2009-10-06  3879  =

a33f6432b3a63a Yan, Zheng    2020-08-11  3880  	dentry =3D d_find_primary(i=
node);
a33f6432b3a63a Yan, Zheng    2020-08-11  3881  	if (dentry) {
a33f6432b3a63a Yan, Zheng    2020-08-11  3882  		/* set pathbase to parent =
dir when msg_version >=3D 2 */
a33f6432b3a63a Yan, Zheng    2020-08-11  3883  		path =3D ceph_mdsc_build_p=
ath(dentry, &pathlen, &pathbase,
a33f6432b3a63a Yan, Zheng    2020-08-11  3884  					    recon_state->msg_ve=
rsion >=3D 2);
a33f6432b3a63a Yan, Zheng    2020-08-11  3885  		dput(dentry);
a33f6432b3a63a Yan, Zheng    2020-08-11  3886  		if (IS_ERR(path)) {
a33f6432b3a63a Yan, Zheng    2020-08-11  3887  			err =3D PTR_ERR(path);
a33f6432b3a63a Yan, Zheng    2020-08-11  3888  			goto out_err;
a33f6432b3a63a Yan, Zheng    2020-08-11  3889  		}
a33f6432b3a63a Yan, Zheng    2020-08-11  3890  	} else {
a33f6432b3a63a Yan, Zheng    2020-08-11  3891  		path =3D NULL;
a33f6432b3a63a Yan, Zheng    2020-08-11  3892  		pathbase =3D 0;
a33f6432b3a63a Yan, Zheng    2020-08-11  3893  	}
a33f6432b3a63a Yan, Zheng    2020-08-11  3894  =

be655596b3de58 Sage Weil     2011-11-30  3895  	spin_lock(&ci->i_ceph_lock);
2f2dc053404feb Sage Weil     2009-10-06  3896  	cap->seq =3D 0;        /* r=
eset cap seq */
2f2dc053404feb Sage Weil     2009-10-06  3897  	cap->issue_seq =3D 0;  /* a=
nd issue_seq */
667ca05cd9f02f Yan, Zheng    2013-05-31  3898  	cap->mseq =3D 0;       /* a=
nd migrate_seq */
52d60f8e18b855 Jeff Layton   2021-06-04  3899  	cap->cap_gen =3D atomic_rea=
d(&cap->session->s_cap_gen);
20cb34ae9e4b00 Sage Weil     2010-05-12  3900  =

a25949b99003b7 Jeff Layton   2020-02-18  3901  	/* These are lost when the =
session goes away */
785892fe88f693 Jeff Layton   2020-01-02  3902  	if (S_ISDIR(inode->i_mode))=
 {
785892fe88f693 Jeff Layton   2020-01-02  3903  		if (cap->issued & CEPH_CAP=
_DIR_CREATE) {
785892fe88f693 Jeff Layton   2020-01-02  3904  			ceph_put_string(rcu_deref=
erence_raw(ci->i_cached_layout.pool_ns));
785892fe88f693 Jeff Layton   2020-01-02  3905  			memset(&ci->i_cached_layo=
ut, 0, sizeof(ci->i_cached_layout));
785892fe88f693 Jeff Layton   2020-01-02  3906  		}
a25949b99003b7 Jeff Layton   2020-02-18  3907  		cap->issued &=3D ~CEPH_CAP=
_ANY_DIR_OPS;
785892fe88f693 Jeff Layton   2020-01-02  3908  	}
a25949b99003b7 Jeff Layton   2020-02-18  3909  =

121f22a19a3057 Yan, Zheng    2016-07-04  3910  	if (recon_state->msg_versio=
n >=3D 2) {
20cb34ae9e4b00 Sage Weil     2010-05-12  3911  		rec.v2.cap_id =3D cpu_to_l=
e64(cap->cap_id);
20cb34ae9e4b00 Sage Weil     2010-05-12  3912  		rec.v2.wanted =3D cpu_to_l=
e32(__ceph_caps_wanted(ci));
20cb34ae9e4b00 Sage Weil     2010-05-12  3913  		rec.v2.issued =3D cpu_to_l=
e32(cap->issued);
20cb34ae9e4b00 Sage Weil     2010-05-12  3914  		rec.v2.snaprealm =3D cpu_t=
o_le64(ci->i_snap_realm->ino);
a33f6432b3a63a Yan, Zheng    2020-08-11 @3915  		rec.v2.pathbase =3D cpu_to=
_le64(pathbase);
ec1dff25b0a012 Jeff Layton   2017-10-31  3916  		rec.v2.flock_len =3D (__fo=
rce __le32)
ec1dff25b0a012 Jeff Layton   2017-10-31  3917  			((ci->i_ceph_flags & CEPH=
_I_ERROR_FILELOCK) ? 0 : 1);
20cb34ae9e4b00 Sage Weil     2010-05-12  3918  	} else {
20cb34ae9e4b00 Sage Weil     2010-05-12  3919  		rec.v1.cap_id =3D cpu_to_l=
e64(cap->cap_id);
20cb34ae9e4b00 Sage Weil     2010-05-12  3920  		rec.v1.wanted =3D cpu_to_l=
e32(__ceph_caps_wanted(ci));
20cb34ae9e4b00 Sage Weil     2010-05-12  3921  		rec.v1.issued =3D cpu_to_l=
e32(cap->issued);
2d6795fbb8c34e Jeff Layton   2021-04-09  3922  		rec.v1.size =3D cpu_to_le6=
4(i_size_read(inode));
9bbeab41ce5054 Arnd Bergmann 2018-07-13  3923  		ceph_encode_timespec64(&re=
c.v1.mtime, &inode->i_mtime);
9bbeab41ce5054 Arnd Bergmann 2018-07-13  3924  		ceph_encode_timespec64(&re=
c.v1.atime, &inode->i_atime);
20cb34ae9e4b00 Sage Weil     2010-05-12  3925  		rec.v1.snaprealm =3D cpu_t=
o_le64(ci->i_snap_realm->ino);
a33f6432b3a63a Yan, Zheng    2020-08-11  3926  		rec.v1.pathbase =3D cpu_to=
_le64(pathbase);
20cb34ae9e4b00 Sage Weil     2010-05-12  3927  	}
3469ed0d149ba7 Yan, Zheng    2016-07-05  3928  =

3469ed0d149ba7 Yan, Zheng    2016-07-05  3929  	if (list_empty(&ci->i_cap_s=
naps)) {
92776fd2c230f8 Yan, Zheng    2017-08-16  3930  		snap_follows =3D ci->i_hea=
d_snapc ? ci->i_head_snapc->seq : 0;
3469ed0d149ba7 Yan, Zheng    2016-07-05  3931  	} else {
3469ed0d149ba7 Yan, Zheng    2016-07-05  3932  		struct ceph_cap_snap *caps=
nap =3D
3469ed0d149ba7 Yan, Zheng    2016-07-05  3933  			list_first_entry(&ci->i_c=
ap_snaps,
3469ed0d149ba7 Yan, Zheng    2016-07-05  3934  					 struct ceph_cap_snap, =
ci_item);
3469ed0d149ba7 Yan, Zheng    2016-07-05  3935  		snap_follows =3D capsnap->=
follows;
20cb34ae9e4b00 Sage Weil     2010-05-12  3936  	}
be655596b3de58 Sage Weil     2011-11-30  3937  	spin_unlock(&ci->i_ceph_loc=
k);
2f2dc053404feb Sage Weil     2009-10-06  3938  =

121f22a19a3057 Yan, Zheng    2016-07-04  3939  	if (recon_state->msg_versio=
n >=3D 2) {
40819f6fb227c1 Greg Farnum   2010-08-02  3940  		int num_fcntl_locks, num_f=
lock_locks;
4deb14a2593dfa Yan, Zheng    2017-09-11  3941  		struct ceph_filelock *floc=
ks =3D NULL;
81c5a1487e52a3 Yan, Zheng    2019-01-01  3942  		size_t struct_len, total_l=
en =3D sizeof(u64);
121f22a19a3057 Yan, Zheng    2016-07-04  3943  		u8 struct_v =3D 0;
40819f6fb227c1 Greg Farnum   2010-08-02  3944  =

39be95e9c8c0b5 Jim Schutt    2013-05-15  3945  encode_again:
b3f8d68f38a879 Yan, Zheng    2017-09-11  3946  		if (rec.v2.flock_len) {
39be95e9c8c0b5 Jim Schutt    2013-05-15  3947  			ceph_count_locks(inode, &=
num_fcntl_locks, &num_flock_locks);
b3f8d68f38a879 Yan, Zheng    2017-09-11  3948  		} else {
b3f8d68f38a879 Yan, Zheng    2017-09-11  3949  			num_fcntl_locks =3D 0;
b3f8d68f38a879 Yan, Zheng    2017-09-11  3950  			num_flock_locks =3D 0;
b3f8d68f38a879 Yan, Zheng    2017-09-11  3951  		}
4deb14a2593dfa Yan, Zheng    2017-09-11  3952  		if (num_fcntl_locks + num_=
flock_locks > 0) {
6da2ec56059c3c Kees Cook     2018-06-12  3953  			flocks =3D kmalloc_array(=
num_fcntl_locks + num_flock_locks,
6da2ec56059c3c Kees Cook     2018-06-12  3954  					       sizeof(struct ce=
ph_filelock),
6da2ec56059c3c Kees Cook     2018-06-12  3955  					       GFP_NOFS);
39be95e9c8c0b5 Jim Schutt    2013-05-15  3956  			if (!flocks) {
39be95e9c8c0b5 Jim Schutt    2013-05-15  3957  				err =3D -ENOMEM;
5ccedf1ccd710b Yan, Zheng    2018-12-13  3958  				goto out_err;
39be95e9c8c0b5 Jim Schutt    2013-05-15  3959  			}
39be95e9c8c0b5 Jim Schutt    2013-05-15  3960  			err =3D ceph_encode_locks=
_to_buffer(inode, flocks,
39be95e9c8c0b5 Jim Schutt    2013-05-15  3961  							  num_fcntl_locks,
39be95e9c8c0b5 Jim Schutt    2013-05-15  3962  							  num_flock_locks);
39be95e9c8c0b5 Jim Schutt    2013-05-15  3963  			if (err) {
39be95e9c8c0b5 Jim Schutt    2013-05-15  3964  				kfree(flocks);
4deb14a2593dfa Yan, Zheng    2017-09-11  3965  				flocks =3D NULL;
39be95e9c8c0b5 Jim Schutt    2013-05-15  3966  				if (err =3D=3D -ENOSPC)
39be95e9c8c0b5 Jim Schutt    2013-05-15  3967  					goto encode_again;
5ccedf1ccd710b Yan, Zheng    2018-12-13  3968  				goto out_err;
39be95e9c8c0b5 Jim Schutt    2013-05-15  3969  			}
4deb14a2593dfa Yan, Zheng    2017-09-11  3970  		} else {
4deb14a2593dfa Yan, Zheng    2017-09-11  3971  			kfree(flocks);
4deb14a2593dfa Yan, Zheng    2017-09-11  3972  			flocks =3D NULL;
4deb14a2593dfa Yan, Zheng    2017-09-11  3973  		}
121f22a19a3057 Yan, Zheng    2016-07-04  3974  =

121f22a19a3057 Yan, Zheng    2016-07-04  3975  		if (recon_state->msg_versi=
on >=3D 3) {
121f22a19a3057 Yan, Zheng    2016-07-04  3976  			/* version, compat_versio=
n and struct_len */
81c5a1487e52a3 Yan, Zheng    2019-01-01  3977  			total_len +=3D 2 * sizeof=
(u8) + sizeof(u32);
3469ed0d149ba7 Yan, Zheng    2016-07-05  3978  			struct_v =3D 2;
121f22a19a3057 Yan, Zheng    2016-07-04  3979  		}
39be95e9c8c0b5 Jim Schutt    2013-05-15  3980  		/*
39be95e9c8c0b5 Jim Schutt    2013-05-15  3981  		 * number of encoded locks=
 is stable, so copy to pagelist
39be95e9c8c0b5 Jim Schutt    2013-05-15  3982  		 */
121f22a19a3057 Yan, Zheng    2016-07-04  3983  		struct_len =3D 2 * sizeof(=
u32) +
40819f6fb227c1 Greg Farnum   2010-08-02  3984  			    (num_fcntl_locks + nu=
m_flock_locks) *
121f22a19a3057 Yan, Zheng    2016-07-04  3985  			    sizeof(struct ceph_fi=
lelock);
121f22a19a3057 Yan, Zheng    2016-07-04  3986  		rec.v2.flock_len =3D cpu_t=
o_le32(struct_len);
121f22a19a3057 Yan, Zheng    2016-07-04  3987  =

a33f6432b3a63a Yan, Zheng    2020-08-11  3988  		struct_len +=3D sizeof(u32=
) + pathlen + sizeof(rec.v2);
121f22a19a3057 Yan, Zheng    2016-07-04  3989  =

3469ed0d149ba7 Yan, Zheng    2016-07-05  3990  		if (struct_v >=3D 2)
3469ed0d149ba7 Yan, Zheng    2016-07-05  3991  			struct_len +=3D sizeof(u6=
4); /* snap_follows */
3469ed0d149ba7 Yan, Zheng    2016-07-05  3992  =

121f22a19a3057 Yan, Zheng    2016-07-04  3993  		total_len +=3D struct_len;
81c5a1487e52a3 Yan, Zheng    2019-01-01  3994  =

81c5a1487e52a3 Yan, Zheng    2019-01-01  3995  		if (pagelist->length + tot=
al_len > RECONNECT_MAX_SIZE) {
81c5a1487e52a3 Yan, Zheng    2019-01-01  3996  			err =3D send_reconnect_pa=
rtial(recon_state);
81c5a1487e52a3 Yan, Zheng    2019-01-01  3997  			if (err)
81c5a1487e52a3 Yan, Zheng    2019-01-01  3998  				goto out_freeflocks;
81c5a1487e52a3 Yan, Zheng    2019-01-01  3999  			pagelist =3D recon_state-=
>pagelist;
5ccedf1ccd710b Yan, Zheng    2018-12-13  4000  		}
121f22a19a3057 Yan, Zheng    2016-07-04  4001  =

81c5a1487e52a3 Yan, Zheng    2019-01-01  4002  		err =3D ceph_pagelist_rese=
rve(pagelist, total_len);
81c5a1487e52a3 Yan, Zheng    2019-01-01  4003  		if (err)
81c5a1487e52a3 Yan, Zheng    2019-01-01  4004  			goto out_freeflocks;
81c5a1487e52a3 Yan, Zheng    2019-01-01  4005  =

81c5a1487e52a3 Yan, Zheng    2019-01-01  4006  		ceph_pagelist_encode_64(pa=
gelist, ceph_ino(inode));
121f22a19a3057 Yan, Zheng    2016-07-04  4007  		if (recon_state->msg_versi=
on >=3D 3) {
121f22a19a3057 Yan, Zheng    2016-07-04  4008  			ceph_pagelist_encode_8(pa=
gelist, struct_v);
121f22a19a3057 Yan, Zheng    2016-07-04  4009  			ceph_pagelist_encode_8(pa=
gelist, 1);
121f22a19a3057 Yan, Zheng    2016-07-04  4010  			ceph_pagelist_encode_32(p=
agelist, struct_len);
121f22a19a3057 Yan, Zheng    2016-07-04  4011  		}
a33f6432b3a63a Yan, Zheng    2020-08-11  4012  		ceph_pagelist_encode_strin=
g(pagelist, path, pathlen);
121f22a19a3057 Yan, Zheng    2016-07-04  4013  		ceph_pagelist_append(pagel=
ist, &rec, sizeof(rec.v2));
121f22a19a3057 Yan, Zheng    2016-07-04  4014  		ceph_locks_to_pagelist(flo=
cks, pagelist,
5ccedf1ccd710b Yan, Zheng    2018-12-13  4015  				       num_fcntl_locks, =
num_flock_locks);
3469ed0d149ba7 Yan, Zheng    2016-07-05  4016  		if (struct_v >=3D 2)
3469ed0d149ba7 Yan, Zheng    2016-07-05  4017  			ceph_pagelist_encode_64(p=
agelist, snap_follows);
81c5a1487e52a3 Yan, Zheng    2019-01-01  4018  out_freeflocks:
39be95e9c8c0b5 Jim Schutt    2013-05-15  4019  		kfree(flocks);
3612abbd5df6ba Sage Weil     2010-09-07  4020  	} else {
5ccedf1ccd710b Yan, Zheng    2018-12-13  4021  		err =3D ceph_pagelist_rese=
rve(pagelist,
81c5a1487e52a3 Yan, Zheng    2019-01-01  4022  					    sizeof(u64) + sizeo=
f(u32) +
81c5a1487e52a3 Yan, Zheng    2019-01-01  4023  					    pathlen + sizeof(re=
c.v1));
a33f6432b3a63a Yan, Zheng    2020-08-11  4024  		if (err)
a33f6432b3a63a Yan, Zheng    2020-08-11  4025  			goto out_err;
5ccedf1ccd710b Yan, Zheng    2018-12-13  4026  =

81c5a1487e52a3 Yan, Zheng    2019-01-01  4027  		ceph_pagelist_encode_64(pa=
gelist, ceph_ino(inode));
121f22a19a3057 Yan, Zheng    2016-07-04  4028  		ceph_pagelist_encode_strin=
g(pagelist, path, pathlen);
121f22a19a3057 Yan, Zheng    2016-07-04  4029  		ceph_pagelist_append(pagel=
ist, &rec, sizeof(rec.v1));
40819f6fb227c1 Greg Farnum   2010-08-02  4030  	}
44c99757fae80e Yan, Zheng    2013-09-22  4031  =

5ccedf1ccd710b Yan, Zheng    2018-12-13  4032  out_err:
a33f6432b3a63a Yan, Zheng    2020-08-11  4033  	ceph_mdsc_free_path(path, p=
athlen);
a33f6432b3a63a Yan, Zheng    2020-08-11  4034  	if (!err)
81c5a1487e52a3 Yan, Zheng    2019-01-01  4035  		recon_state->nr_caps++;
81c5a1487e52a3 Yan, Zheng    2019-01-01  4036  	return err;
81c5a1487e52a3 Yan, Zheng    2019-01-01  4037  }
81c5a1487e52a3 Yan, Zheng    2019-01-01  4038  =


:::::: The code at line 3915 was first introduced by commit
:::::: a33f6432b3a63a4909dbbb0967f7c9df8ff2de91 ceph: encode inodes' parent=
/d_name in cap reconnect message

:::::: TO: Yan, Zheng <zyan@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5774419216804456861==--

