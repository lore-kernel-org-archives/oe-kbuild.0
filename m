Content-Type: multipart/mixed; boundary="===============7051896372950252844=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] nfs4: handle async processing of F_SETLK with FL_SLEEP
Date: Tue, 28 Dec 2021 16:43:58 +0800
Message-ID: <202112281638.RNX7e40X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7051896372950252844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <3a2c6cb9-abe7-ab32-b11c-d78621361555@virtuozzo.com>
References: <3a2c6cb9-abe7-ab32-b11c-d78621361555@virtuozzo.com>
TO: Vasily Averin <vvs@virtuozzo.com>
TO: Trond Myklebust <trond.myklebust@hammerspace.com>
TO: Anna Schumaker <anna.schumaker@netapp.com>
CC: kernel(a)openvz.org
CC: linux-nfs(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Vasily,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vasily-Averin/nfs4-handle-=
async-processing-of-F_SETLK-with-FL_SLEEP/20211227-184632
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-m021-20211227 (https://download.01.org/0day-ci/arch=
ive/20211228/202112281638.RNX7e40X-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/nfs/nfs4proc.c:7202 _nfs4_proc_setlk() warn: should this be a bitwise op?

Old smatch warnings:
fs/nfs/nfs4proc.c:1382 nfs4_opendata_alloc() error: we previously assumed '=
c' could be null (see line 1350)
fs/nfs/nfs4proc.c:2201 _nfs4_do_open_reclaim() warn: passing a valid pointe=
r to 'PTR_ERR'
fs/nfs/nfs4proc.c:2310 nfs4_open_delegation_recall() warn: passing a valid =
pointer to 'PTR_ERR'
fs/nfs/nfs4proc.c:2728 _nfs4_open_expired() warn: passing a valid pointer t=
o 'PTR_ERR'

vim +7202 fs/nfs/nfs4proc.c

f062eb6ced3b29 Bryan Schumaker 2011-06-02  7193  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  7194  static int _nfs4_proc_setl=
k(struct nfs4_state *state, int cmd, struct file_lock *request)
^1da177e4c3f41 Linus Torvalds  2005-04-16  7195  {
19e03c570e6099 Trond Myklebust 2008-12-23  7196  	struct nfs_inode *nfsi =
=3D NFS_I(state->inode);
11476e9dec39d9 Chuck Lever     2016-04-11  7197  	struct nfs4_state_owner *=
sp =3D state->owner;
01c3b861cd77b2 Trond Myklebust 2006-06-29  7198  	unsigned char fl_flags =
=3D request->fl_flags;
1ea67dbd982827 Jeff Layton     2016-09-17  7199  	int status;
^1da177e4c3f41 Linus Torvalds  2005-04-16  7200  =

01c3b861cd77b2 Trond Myklebust 2006-06-29  7201  	request->fl_flags |=3D FL=
_ACCESS;
7ae55d384b2f33 Vasily Averin   2021-12-27 @7202  	if ((request->fl_flags &&=
 FL_SLEEP) && IS_SETLK(cmd))
7ae55d384b2f33 Vasily Averin   2021-12-27  7203  		status =3D posix_lock_fi=
le(request->fl_file, request, NULL);
7ae55d384b2f33 Vasily Averin   2021-12-27  7204  	else
75575ddf29cbbf Jeff Layton     2016-09-17  7205  		status =3D locks_lock_in=
ode_wait(state->inode, request);
7ae55d384b2f33 Vasily Averin   2021-12-27  7206  	if (status)
01c3b861cd77b2 Trond Myklebust 2006-06-29  7207  		goto out;
11476e9dec39d9 Chuck Lever     2016-04-11  7208  	mutex_lock(&sp->so_delegr=
eturn_mutex);
19e03c570e6099 Trond Myklebust 2008-12-23  7209  	down_read(&nfsi->rwsem);
01c3b861cd77b2 Trond Myklebust 2006-06-29  7210  	if (test_bit(NFS_DELEGATE=
D_STATE, &state->flags)) {
01c3b861cd77b2 Trond Myklebust 2006-06-29  7211  		/* Yes: cache locks! */
01c3b861cd77b2 Trond Myklebust 2006-06-29  7212  		/* ...but avoid races wi=
th delegation recall... */
01c3b861cd77b2 Trond Myklebust 2006-06-29  7213  		request->fl_flags =3D fl=
_flags & ~FL_SLEEP;
75575ddf29cbbf Jeff Layton     2016-09-17  7214  		status =3D locks_lock_in=
ode_wait(state->inode, request);
9a99af494bd714 Trond Myklebust 2013-02-04  7215  		up_read(&nfsi->rwsem);
11476e9dec39d9 Chuck Lever     2016-04-11  7216  		mutex_unlock(&sp->so_del=
egreturn_mutex);
9a99af494bd714 Trond Myklebust 2013-02-04  7217  		goto out;
9a99af494bd714 Trond Myklebust 2013-02-04  7218  	}
19e03c570e6099 Trond Myklebust 2008-12-23  7219  	up_read(&nfsi->rwsem);
11476e9dec39d9 Chuck Lever     2016-04-11  7220  	mutex_unlock(&sp->so_dele=
greturn_mutex);
c69899a17ca483 Trond Myklebust 2015-01-24  7221  	status =3D _nfs4_do_setlk=
(state, cmd, request, NFS_LOCK_NEW);
01c3b861cd77b2 Trond Myklebust 2006-06-29  7222  out:
01c3b861cd77b2 Trond Myklebust 2006-06-29  7223  	request->fl_flags =3D fl_=
flags;
^1da177e4c3f41 Linus Torvalds  2005-04-16  7224  	return status;
^1da177e4c3f41 Linus Torvalds  2005-04-16  7225  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  7226  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7051896372950252844==--

