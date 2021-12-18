Content-Type: multipart/mixed; boundary="===============4542445332681320607=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] nfs: block notification on fs with its own ->lock
Date: Sun, 19 Dec 2021 07:32:31 +0800
Message-ID: <202112190732.2tW2ZDsC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4542445332681320607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211216172013.GA13418@fieldses.org>
References: <20211216172013.GA13418@fieldses.org>
TO: bfields(a)fieldses.org

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v5.16-rc5 next-20211217]
[cannot apply to cel-2.6/for-next jlayton/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/bfields-fieldses-org-J-Bru=
ce-Fields/nfs-block-notification-on-fs-with-its-own-lock/20211217-012235
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20211216 (https://download.01.org/0day-ci/ar=
chive/20211219/202112190732.2tW2ZDsC-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3=
d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/61c7ebf40fcfd8350ff7d4b21=
01c18ea234fbcae
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review bfields-fieldses-org-J-Bruce-Field=
s/nfs-block-notification-on-fs-with-its-own-lock/20211217-012235
        git checkout 61c7ebf40fcfd8350ff7d4b2101c18ea234fbcae
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:304:6: note: 'block' is not equal to NULL
           if (block !=3D NULL)
               ^~~~~
   fs/lockd/svclock.c:304:2: note: Taking true branch
           if (block !=3D NULL)
           ^
   fs/lockd/svclock.c:305:3: note: Calling 'kref_put_mutex'
                   kref_put_mutex(&block->b_count, nlmsvc_free_block, &bloc=
k->b_file->f_mutex);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:75:6: note: Assuming the condition is true
           if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:75:2: note: Taking true branch
           if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
           ^
   include/linux/kref.h:76:3: note: Calling 'nlmsvc_free_block'
                   release(kref);
                   ^~~~~~~~~~~~~
   fs/lockd/svclock.c:287:28: note: Left side of '&&' is false
           struct nlm_block *block =3D container_of(kref, struct nlm_block,=
 b_count);
                                     ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/lockd/svclock.c:287:28: note: Taking false branch
           struct nlm_block *block =3D container_of(kref, struct nlm_block,=
 b_count);
                                     ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/lockd/svclock.c:287:28: note: Loop condition is false.  Exiting loop
           struct nlm_block *block =3D container_of(kref, struct nlm_block,=
 b_count);
                                     ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/lockd/svclock.c:290:2: note: Loop condition is false.  Exiting loop
           dprintk("lockd: freeing block %p...\n", block);
           ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/lockd/svclock.c:299:2: note: Memory is released
           kfree(block);
           ^~~~~~~~~~~~
   include/linux/kref.h:76:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   fs/lockd/svclock.c:305:3: note: Returning; memory was released
                   kref_put_mutex(&block->b_count, nlmsvc_free_block, &bloc=
k->b_file->f_mutex);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:138:3: note: Returning; memory was released
                   nlmsvc_release_block(block);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:281:2: note: Returning; memory was released
           nlmsvc_remove_block(block);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:974:3: note: Returning; memory was released
                   nlmsvc_unlink_block(block);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:976:2: note: Calling 'nlmsvc_release_block'
           nlmsvc_release_block(block);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:304:6: note: 'block' is not equal to NULL
           if (block !=3D NULL)
               ^~~~~
   fs/lockd/svclock.c:304:2: note: Taking true branch
           if (block !=3D NULL)
           ^
   fs/lockd/svclock.c:305:55: note: Use of memory after it is freed
                   kref_put_mutex(&block->b_count, nlmsvc_free_block, &bloc=
k->b_file->f_mutex);
                                                                       ^~~~=
~~~~~~~~~
>> fs/lockd/svclock.c:474:17: warning: Value stored to 'inode' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct inode            *inode =3D nlmsvc_file_inode(file);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:474:17: note: Value stored to 'inode' during its init=
ialization is never read
           struct inode            *inode =3D nlmsvc_file_inode(file);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:575:2: warning: Use of memory after it is freed [clan=
g-analyzer-unix.Malloc]
           nlmsvc_release_block(block);
           ^                    ~~~~~
   fs/lockd/svclock.c:480:2: note: Loop condition is false.  Exiting loop
           dprintk("lockd: nlmsvc_lock(%s/%ld, ty=3D%d, pi=3D%d, %Ld-%Ld, b=
l=3D%d)\n",
           ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/lockd/svclock.c:487:6: note: Assuming field 'lock' is null
           if (nlmsvc_file_file(file)->f_op->lock) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:487:2: note: Taking false branch
           if (nlmsvc_file_file(file)->f_op->lock) {
           ^
   fs/lockd/svclock.c:498:6: note: Assuming 'block' is not equal to NULL
           if (block =3D=3D NULL) {
               ^~~~~~~~~~~~~
   fs/lockd/svclock.c:498:2: note: Taking false branch
           if (block =3D=3D NULL) {
           ^
   fs/lockd/svclock.c:507:6: note: Assuming the condition is true
           if (block->b_flags & B_QUEUED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:507:2: note: Taking true branch
           if (block->b_flags & B_QUEUED) {
           ^
   fs/lockd/svclock.c:508:3: note: Loop condition is false.  Exiting loop
                   dprintk("lockd: nlmsvc_lock deferred block %p flags %d\n=
",
                   ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/lockd/svclock.c:510:7: note: Assuming field 'b_granted' is not equal =
to 0
                   if (block->b_granted) {
                       ^~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:510:3: note: Taking true branch
                   if (block->b_granted) {
                   ^
   fs/lockd/svclock.c:511:4: note: Calling 'nlmsvc_unlink_block'
                           nlmsvc_unlink_block(block);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:277:2: note: Loop condition is false.  Exiting loop
           dprintk("lockd: unlinking block %p...\n", block);
           ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/lockd/svclock.c:281:2: note: Calling 'nlmsvc_remove_block'
           nlmsvc_remove_block(block);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:134:6: note: Assuming the condition is true
           if (!list_empty(&block->b_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:134:2: note: Taking true branch
           if (!list_empty(&block->b_list)) {
           ^
   fs/lockd/svclock.c:138:3: note: Calling 'nlmsvc_release_block'
                   nlmsvc_release_block(block);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/svclock.c:304:6: note: 'block' is not equal to NULL
           if (block !=3D NULL)
               ^~~~~
   fs/lockd/svclock.c:304:2: note: Taking true branch
           if (block !=3D NULL)
           ^
   fs/lockd/svclock.c:305:3: note: Calling 'kref_put_mutex'
                   kref_put_mutex(&block->b_count, nlmsvc_free_block, &bloc=
k->b_file->f_mutex);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:75:6: note: Assuming the condition is true
           if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:75:2: note: Taking true branch
           if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
           ^
   include/linux/kref.h:76:3: note: Calling 'nlmsvc_free_block'
                   release(kref);
                   ^~~~~~~~~~~~~
   fs/lockd/svclock.c:287:28: note: Left side of '&&' is false
           struct nlm_block *block =3D container_of(kref, struct nlm_block,=
 b_count);
                                     ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/lockd/svclock.c:287:28: note: Taking false branch
           struct nlm_block *block =3D container_of(kref, struct nlm_block,=
 b_count);

vim +/inode +474 fs/lockd/svclock.c

2b36f412ab6f2e Marc Eshel           2006-11-28  463  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  464  /*
^1da177e4c3f41 Linus Torvalds       2005-04-16  465   * Attempt to establis=
h a lock, and if it can't be granted, block it
^1da177e4c3f41 Linus Torvalds       2005-04-16  466   * if required.
^1da177e4c3f41 Linus Torvalds       2005-04-16  467   */
52921e02a4f416 Al Viro              2006-10-19  468  __be32
^1da177e4c3f41 Linus Torvalds       2005-04-16  469  nlmsvc_lock(struct svc=
_rqst *rqstp, struct nlm_file *file,
6cde4de8077349 Jeff Layton          2008-07-15  470  	    struct nlm_host *=
host, struct nlm_lock *lock, int wait,
b2b5028905226f J. Bruce Fields      2008-02-06  471  	    struct nlm_cookie=
 *cookie, int reclaim)
^1da177e4c3f41 Linus Torvalds       2005-04-16  472  {
f812048020282f Marc Eshel           2006-12-05  473  	struct nlm_block	*blo=
ck =3D NULL;
b840be2f00c0bc J. Bruce Fields      2021-08-20 @474  	struct inode		*inode =
=3D nlmsvc_file_inode(file);
^1da177e4c3f41 Linus Torvalds       2005-04-16  475  	int			error;
7f024fcd5c97dc J. Bruce Fields      2021-08-23  476  	int			mode;
b840be2f00c0bc J. Bruce Fields      2021-08-20  477  	int			async_block =3D=
 0;
52921e02a4f416 Al Viro              2006-10-19  478  	__be32			ret;
^1da177e4c3f41 Linus Torvalds       2005-04-16  479  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  480  	dprintk("lockd: nlmsv=
c_lock(%s/%ld, ty=3D%d, pi=3D%d, %Ld-%Ld, bl=3D%d)\n",
b840be2f00c0bc J. Bruce Fields      2021-08-20  481  				inode->i_sb->s_id,=
 inode->i_ino,
^1da177e4c3f41 Linus Torvalds       2005-04-16  482  				lock->fl.fl_type, =
lock->fl.fl_pid,
^1da177e4c3f41 Linus Torvalds       2005-04-16  483  				(long long)lock->f=
l.fl_start,
^1da177e4c3f41 Linus Torvalds       2005-04-16  484  				(long long)lock->f=
l.fl_end,
^1da177e4c3f41 Linus Torvalds       2005-04-16  485  				wait);
^1da177e4c3f41 Linus Torvalds       2005-04-16  486  =

61c7ebf40fcfd8 J. Bruce Fields      2021-12-16  487  	if (nlmsvc_file_file(=
file)->f_op->lock) {
b840be2f00c0bc J. Bruce Fields      2021-08-20  488  		async_block =3D wait;
b840be2f00c0bc J. Bruce Fields      2021-08-20  489  		wait =3D 0;
b840be2f00c0bc J. Bruce Fields      2021-08-20  490  	}
b840be2f00c0bc J. Bruce Fields      2021-08-20  491  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  492  	/* Lock file against =
concurrent access */
89e63ef609fb00 Neil Brown           2006-10-04  493  	mutex_lock(&file->f_m=
utex);
f812048020282f Marc Eshel           2006-12-05  494  	/* Get existing block=
 (in case client is busy-waiting)
f812048020282f Marc Eshel           2006-12-05  495  	 * or create new block
f812048020282f Marc Eshel           2006-12-05  496  	 */
d9f6eb75d49007 Trond Myklebust      2006-03-20  497  	block =3D nlmsvc_look=
up_block(file, lock);
09c7938c5640a6 Trond Myklebust      2006-03-20  498  	if (block =3D=3D NULL=
) {
560de0e65904db J. Bruce Fields      2008-07-15  499  		block =3D nlmsvc_cre=
ate_block(rqstp, host, file, lock, cookie);
f812048020282f Marc Eshel           2006-12-05  500  		ret =3D nlm_lck_deni=
ed_nolocks;
f812048020282f Marc Eshel           2006-12-05  501  		if (block =3D=3D NUL=
L)
f812048020282f Marc Eshel           2006-12-05  502  			goto out;
92737230dd3f14 Trond Myklebust      2006-03-20  503  		lock =3D &block->b_c=
all->a_args.lock;
f812048020282f Marc Eshel           2006-12-05  504  	} else
f812048020282f Marc Eshel           2006-12-05  505  		lock->fl.fl_flags &=
=3D ~FL_SLEEP;
^1da177e4c3f41 Linus Torvalds       2005-04-16  506  =

1a8322b2b02071 Marc Eshel           2006-11-28  507  	if (block->b_flags & =
B_QUEUED) {
1a8322b2b02071 Marc Eshel           2006-11-28  508  		dprintk("lockd: nlms=
vc_lock deferred block %p flags %d\n",
1a8322b2b02071 Marc Eshel           2006-11-28  509  							block, block->b=
_flags);
1a8322b2b02071 Marc Eshel           2006-11-28  510  		if (block->b_granted=
) {
1a8322b2b02071 Marc Eshel           2006-11-28  511  			nlmsvc_unlink_block=
(block);
1a8322b2b02071 Marc Eshel           2006-11-28  512  			ret =3D nlm_granted;
1a8322b2b02071 Marc Eshel           2006-11-28  513  			goto out;
1a8322b2b02071 Marc Eshel           2006-11-28  514  		}
1a8322b2b02071 Marc Eshel           2006-11-28  515  		if (block->b_flags &=
 B_TIMED_OUT) {
1a8322b2b02071 Marc Eshel           2006-11-28  516  			nlmsvc_unlink_block=
(block);
1a8322b2b02071 Marc Eshel           2006-11-28  517  			ret =3D nlm_lck_den=
ied;
1a8322b2b02071 Marc Eshel           2006-11-28  518  			goto out;
1a8322b2b02071 Marc Eshel           2006-11-28  519  		}
1a8322b2b02071 Marc Eshel           2006-11-28  520  		ret =3D nlm_drop_rep=
ly;
1a8322b2b02071 Marc Eshel           2006-11-28  521  		goto out;
1a8322b2b02071 Marc Eshel           2006-11-28  522  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  523  =

5ccb0066f2d561 Stanislav Kinsbursky 2012-07-25  524  	if (locks_in_grace(SV=
C_NET(rqstp)) && !reclaim) {
b2b5028905226f J. Bruce Fields      2008-02-06  525  		ret =3D nlm_lck_deni=
ed_grace_period;
b2b5028905226f J. Bruce Fields      2008-02-06  526  		goto out;
b2b5028905226f J. Bruce Fields      2008-02-06  527  	}
5ccb0066f2d561 Stanislav Kinsbursky 2012-07-25  528  	if (reclaim && !locks=
_in_grace(SVC_NET(rqstp))) {
d22b1cff099737 J. Bruce Fields      2008-02-06  529  		ret =3D nlm_lck_deni=
ed_grace_period;
d22b1cff099737 J. Bruce Fields      2008-02-06  530  		goto out;
d22b1cff099737 J. Bruce Fields      2008-02-06  531  	}
b2b5028905226f J. Bruce Fields      2008-02-06  532  =

1a8322b2b02071 Marc Eshel           2006-11-28  533  	if (!wait)
1a8322b2b02071 Marc Eshel           2006-11-28  534  		lock->fl.fl_flags &=
=3D ~FL_SLEEP;
7f024fcd5c97dc J. Bruce Fields      2021-08-23  535  	mode =3D lock_to_open=
mode(&lock->fl);
7f024fcd5c97dc J. Bruce Fields      2021-08-23  536  	error =3D vfs_lock_fi=
le(file->f_file[mode], F_SETLK, &lock->fl, NULL);
1a8322b2b02071 Marc Eshel           2006-11-28  537  	lock->fl.fl_flags &=
=3D ~FL_SLEEP;
a85f193e2fb7d5 Andy Adamson         2006-03-20  538  =

1a8322b2b02071 Marc Eshel           2006-11-28  539  	dprintk("lockd: vfs_l=
ock_file returned %d\n", error);
09c7938c5640a6 Trond Myklebust      2006-03-20  540  	switch (error) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  541  		case 0:
15dadef9460ad8 Andy Adamson         2006-03-20  542  			ret =3D nlm_granted;
15dadef9460ad8 Andy Adamson         2006-03-20  543  			goto out;
09c7938c5640a6 Trond Myklebust      2006-03-20  544  		case -EAGAIN:
e33d1ea60c3a17 Miklos Szeredi       2009-02-09  545  			/*
e33d1ea60c3a17 Miklos Szeredi       2009-02-09  546  			 * If this is a blo=
cking request for an
e33d1ea60c3a17 Miklos Szeredi       2009-02-09  547  			 * already pending =
lock request then we need
e33d1ea60c3a17 Miklos Szeredi       2009-02-09  548  			 * to put it back o=
n lockd's block list
e33d1ea60c3a17 Miklos Szeredi       2009-02-09  549  			 */
e33d1ea60c3a17 Miklos Szeredi       2009-02-09  550  			if (wait)
9d9b87c1218be7 J. Bruce Fields      2009-02-04  551  				break;
b840be2f00c0bc J. Bruce Fields      2021-08-20  552  			ret =3D async_block=
 ? nlm_lck_blocked : nlm_lck_denied;
e33d1ea60c3a17 Miklos Szeredi       2009-02-09  553  			goto out;
bde74e4bc64415 Miklos Szeredi       2008-07-25  554  		case FILE_LOCK_DEFER=
RED:
1a8322b2b02071 Marc Eshel           2006-11-28  555  			if (wait)
1a8322b2b02071 Marc Eshel           2006-11-28  556  				break;
1a8322b2b02071 Marc Eshel           2006-11-28  557  			/* Filesystem lock =
operation is in progress
1a8322b2b02071 Marc Eshel           2006-11-28  558  			   Add it to the qu=
eue waiting for callback */
1a8322b2b02071 Marc Eshel           2006-11-28  559  			ret =3D nlmsvc_defe=
r_lock_rqst(rqstp, block);
1a8322b2b02071 Marc Eshel           2006-11-28  560  			goto out;
09c7938c5640a6 Trond Myklebust      2006-03-20  561  		case -EDEADLK:
15dadef9460ad8 Andy Adamson         2006-03-20  562  			ret =3D nlm_deadloc=
k;
15dadef9460ad8 Andy Adamson         2006-03-20  563  			goto out;
^1da177e4c3f41 Linus Torvalds       2005-04-16  564  		default:			/* includ=
es ENOLCK */
15dadef9460ad8 Andy Adamson         2006-03-20  565  			ret =3D nlm_lck_den=
ied_nolocks;
15dadef9460ad8 Andy Adamson         2006-03-20  566  			goto out;
^1da177e4c3f41 Linus Torvalds       2005-04-16  567  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  568  =

09c7938c5640a6 Trond Myklebust      2006-03-20  569  	ret =3D nlm_lck_block=
ed;
^1da177e4c3f41 Linus Torvalds       2005-04-16  570  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  571  	/* Append to list of =
blocked */
f812048020282f Marc Eshel           2006-12-05  572  	nlmsvc_insert_block(b=
lock, NLM_NEVER);
15dadef9460ad8 Andy Adamson         2006-03-20  573  out:
89e63ef609fb00 Neil Brown           2006-10-04  574  	mutex_unlock(&file->f=
_mutex);
6849c0cab69f5d Trond Myklebust      2006-03-20  575  	nlmsvc_release_block(=
block);
15dadef9460ad8 Andy Adamson         2006-03-20  576  	dprintk("lockd: nlmsv=
c_lock returned %u\n", ret);
15dadef9460ad8 Andy Adamson         2006-03-20  577  	return ret;
^1da177e4c3f41 Linus Torvalds       2005-04-16  578  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  579  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4542445332681320607==--

