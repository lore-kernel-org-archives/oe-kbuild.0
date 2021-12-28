Content-Type: multipart/mixed; boundary="===============6231573871228319907=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] nfs: local_lock: handle async processing of F_SETLK with FL_SLEEP
Date: Tue, 28 Dec 2021 12:19:54 +0800
Message-ID: <202112281211.SsWl4cfI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6231573871228319907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <6613b17b-43bd-07d0-2ca7-1581a39cdf7b@virtuozzo.com>
References: <6613b17b-43bd-07d0-2ca7-1581a39cdf7b@virtuozzo.com>
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

url:    https://github.com/0day-ci/linux/commits/Vasily-Averin/nfs-local_lo=
ck-handle-async-processing-of-F_SETLK-with-FL_SLEEP/20211227-184705
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-m021-20211227 (https://download.01.org/0day-ci/arch=
ive/20211228/202112281211.SsWl4cfI-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/nfs/file.c:772 do_setlk() warn: should this be a bitwise op?

vim +772 fs/nfs/file.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  751  =

5eebde23223aeb Suresh Jayaraman 2010-09-23  752  static int
5eebde23223aeb Suresh Jayaraman 2010-09-23  753  do_setlk(struct file *filp=
, int cmd, struct file_lock *fl, int is_local)
^1da177e4c3f41 Linus Torvalds   2005-04-16  754  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  755  	struct inode *inode =3D f=
ilp->f_mapping->host;
^1da177e4c3f41 Linus Torvalds   2005-04-16  756  	int status;
^1da177e4c3f41 Linus Torvalds   2005-04-16  757  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  758  	/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  759  	 * Flush all pending writ=
es before doing anything
^1da177e4c3f41 Linus Torvalds   2005-04-16  760  	 * with locks..
^1da177e4c3f41 Linus Torvalds   2005-04-16  761  	 */
29884df0d89c1d Trond Myklebust  2005-12-13  762  	status =3D nfs_sync_mappi=
ng(filp->f_mapping);
29884df0d89c1d Trond Myklebust  2005-12-13  763  	if (status !=3D 0)
^1da177e4c3f41 Linus Torvalds   2005-04-16  764  		goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  765  =

5eebde23223aeb Suresh Jayaraman 2010-09-23  766  	/*
5eebde23223aeb Suresh Jayaraman 2010-09-23  767  	 * Use local locking if m=
ounted with "-onolock" or with appropriate
5eebde23223aeb Suresh Jayaraman 2010-09-23  768  	 * "-olocal_lock=3D"
5eebde23223aeb Suresh Jayaraman 2010-09-23  769  	 */
5eebde23223aeb Suresh Jayaraman 2010-09-23  770  	if (!is_local)
^1da177e4c3f41 Linus Torvalds   2005-04-16  771  		status =3D NFS_PROTO(ino=
de)->lock(filp, cmd, fl);
00e7edbaaa914f Vasily Averin    2021-12-27 @772  	else if ((fl->fl_flags &&=
 FL_SLEEP) && IS_SETLK(cmd))
00e7edbaaa914f Vasily Averin    2021-12-27  773  		status =3D posix_lock_fi=
le(filp, fl, NULL);
c4d7c402b788b7 Trond Myklebust  2008-04-01  774  	else
75575ddf29cbbf Jeff Layton      2016-09-17  775  		status =3D locks_lock_fi=
le_wait(filp, fl);
00e7edbaaa914f Vasily Averin    2021-12-27  776  	if (status)
^1da177e4c3f41 Linus Torvalds   2005-04-16  777  		goto out;
6b96724e507fec Ricardo Labiaga  2010-10-12  778  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  779  	/*
779eafab06036f NeilBrown        2017-08-18  780  	 * Invalidate cache to pr=
event missing any changes.  If
779eafab06036f NeilBrown        2017-08-18  781  	 * the file is mapped, cl=
ear the page cache as well so
779eafab06036f NeilBrown        2017-08-18  782  	 * those mappings will be=
 loaded.
6b96724e507fec Ricardo Labiaga  2010-10-12  783  	 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  784  	 * This makes locking act=
 as a cache coherency point.
^1da177e4c3f41 Linus Torvalds   2005-04-16  785  	 */
29884df0d89c1d Trond Myklebust  2005-12-13  786  	nfs_sync_mapping(filp->f_=
mapping);
779eafab06036f NeilBrown        2017-08-18  787  	if (!NFS_PROTO(inode)->ha=
ve_delegation(inode, FMODE_READ)) {
442ce0499c0535 NeilBrown        2017-07-24  788  		nfs_zap_caches(inode);
779eafab06036f NeilBrown        2017-08-18  789  		if (mapping_mapped(filp-=
>f_mapping))
779eafab06036f NeilBrown        2017-08-18  790  			nfs_revalidate_mapping(=
inode, filp->f_mapping);
779eafab06036f NeilBrown        2017-08-18  791  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  792  out:
^1da177e4c3f41 Linus Torvalds   2005-04-16  793  	return status;
^1da177e4c3f41 Linus Torvalds   2005-04-16  794  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  795  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6231573871228319907==--

