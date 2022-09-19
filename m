Content-Type: multipart/mixed; boundary="===============3364589273998786563=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/9p/vfs_dir.c:211:16: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 19 Sep 2022 11:36:45 +0800
Message-ID: <202209191101.P6CJtb56-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3364589273998786563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/9p/vfs=
_dir.c:211:16: warning: use of uninitialized value '<unknown>' [CWE-457] [-=
Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: 24e42e32d347f0787a6f99aeb590f3aaa7221093 9p: Use fscache indexing r=
ewrite and reenable caching
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220919/202209191101.P6CJtb56-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D24e42e32d347f0787a6f99aeb590f3aaa7221093
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 24e42e32d347f0787a6f99aeb590f3aaa7221093
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   fs/9p/vfs_dir.c: In function 'v9fs_dir_release':
>> fs/9p/vfs_dir.c:211:16: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     211 |         __le32 version;
         |                ^~~~~~~
     'v9fs_dir_release': event 1
       |
       |  211 |         __le32 version;
       |      |                ^~~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   fs/9p/vfs_dir.c:212:16: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     212 |         loff_t i_size;
         |                ^~~~~~
     'v9fs_dir_release': event 1
       |
       |  212 |         loff_t i_size;
       |      |                ^~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
--
   fs/9p/cache.c: In function 'v9fs_cache_inode_get_cookie':
>> fs/9p/cache.c:54:16: warning: use of uninitialized value '<unknown>' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
      54 |         __le32 version;
         |                ^~~~~~~
     'v9fs_cache_inode_get_cookie': event 1
       |
       |   54 |         __le32 version;
       |      |                ^~~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   fs/9p/cache.c:55:16: warning: use of uninitialized value '<unknown>' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
      55 |         __le64 path;
         |                ^~~~
     'v9fs_cache_inode_get_cookie': event 1
       |
       |   55 |         __le64 path;
       |      |                ^~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |

vim +211 fs/9p/vfs_dir.c

7751bdb3a095ad Sripathi Kodi       2010-06-04  198  =

e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  199  =

e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  200  /**
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  201   * v9fs_dir_release - c=
lose a directory
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  202   * @inode: inode of the=
 directory
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  203   * @filp: file pointer =
to a directory
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  204   *
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  205   */
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  206  =

e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  207  int v9fs_dir_release(st=
ruct inode *inode, struct file *filp)
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  208  {
24e42e32d347f0 David Howells       2020-11-18  209  	struct v9fs_inode *v9i=
node =3D V9FS_I(inode);
bd238fb431f319 Latchesar Ionkov    2007-07-10  210  	struct p9_fid *fid;
24e42e32d347f0 David Howells       2020-11-18 @211  	__le32 version;
24e42e32d347f0 David Howells       2020-11-18  212  	loff_t i_size;
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  213  =

bd238fb431f319 Latchesar Ionkov    2007-07-10  214  	fid =3D filp->private_=
data;
5d3851530d6d68 Joe Perches         2011-11-28  215  	p9_debug(P9_DEBUG_VFS,=
 "inode: %p filp: %p fid: %d\n",
62726a7ab3a6a3 jvrao               2010-08-25  216  		 inode, filp, fid ? f=
id->fid : -1);
6636b6dcc3db22 Jianyong Wu         2020-09-23  217  	if (fid) {
987a64850996db Greg Kurz           2020-09-23  218  		spin_lock(&inode->i_l=
ock);
987a64850996db Greg Kurz           2020-09-23  219  		hlist_del(&fid->ilist=
);
987a64850996db Greg Kurz           2020-09-23  220  		spin_unlock(&inode->i=
_lock);
bd238fb431f319 Latchesar Ionkov    2007-07-10  221  		p9_client_clunk(fid);
6636b6dcc3db22 Jianyong Wu         2020-09-23  222  	}
24e42e32d347f0 David Howells       2020-11-18  223  =

24e42e32d347f0 David Howells       2020-11-18  224  	if ((filp->f_mode & FM=
ODE_WRITE)) {
24e42e32d347f0 David Howells       2020-11-18  225  		version =3D cpu_to_le=
32(v9inode->qid.version);
24e42e32d347f0 David Howells       2020-11-18  226  		i_size =3D i_size_rea=
d(inode);
24e42e32d347f0 David Howells       2020-11-18  227  		fscache_unuse_cookie(=
v9fs_inode_cookie(v9inode),
24e42e32d347f0 David Howells       2020-11-18  228  				     &version, &i_s=
ize);
24e42e32d347f0 David Howells       2020-11-18  229  	} else {
24e42e32d347f0 David Howells       2020-11-18  230  		fscache_unuse_cookie(=
v9fs_inode_cookie(v9inode), NULL, NULL);
24e42e32d347f0 David Howells       2020-11-18  231  	}
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  232  	return 0;
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  233  }
e69e7fe5b0c86b Eric Van Hensbergen 2005-09-09  234  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3364589273998786563==--

