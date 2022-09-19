Content-Type: multipart/mixed; boundary="===============5962748991673161742=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/9p/vfs_super.c:117:24: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 19 Sep 2022 23:31:20 +0800
Message-ID: <202209192322.oaidgTqV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5962748991673161742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/9p/vfs=
_super.c:117:24: warning: use of uninitialized value '<unknown>' [CWE-457] =
[-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dominique Martinet <asmadeus@codewreck.org>
CC: Tyler Hicks <tyhicks@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: dafbe689736f62c696ac64809b17bdc752cfbe76 9p fid refcount: cleanup p=
9_fid_put calls
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220919/202209192322.oaidgTqV-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddafbe689736f62c696ac64809b17bdc752cfbe76
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dafbe689736f62c696ac64809b17bdc752cfbe76
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   fs/9p/vfs_super.c: In function 'v9fs_mount':
>> fs/9p/vfs_super.c:117:24: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     117 |         struct p9_fid *fid;
         |                        ^~~
     'v9fs_mount': event 1
       |
       |  117 |         struct p9_fid *fid;
       |      |                        ^~~
       |      |                        |
       |      |                        (1) use of uninitialized value '<unk=
nown>' here
       |
--
   fs/9p/vfs_file.c: In function 'v9fs_file_open':
>> fs/9p/vfs_file.c:47:24: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      47 |         struct p9_fid *fid, *writeback_fid;
         |                        ^~~
     'v9fs_file_open': event 1
       |
       |   47 |         struct p9_fid *fid, *writeback_fid;
       |      |                        ^~~
       |      |                        |
       |      |                        (1) use of uninitialized value '<unk=
nown>' here
       |

vim +117 fs/9p/vfs_super.c

9e82cf6a802a72 Eric Van Hensbergen 2005-09-09   99  =

9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  100  /**
d2d1ea93069bd7 Al Viro             2010-07-25  101   * v9fs_mount - mount a=
 superblock
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  102   * @fs_type: file syste=
m type
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  103   * @flags: mount flags
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  104   * @dev_name: device na=
me that was mounted
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  105   * @data: mount options
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  106   *
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  107   */
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  108  =

d2d1ea93069bd7 Al Viro             2010-07-25  109  static struct dentry *v=
9fs_mount(struct file_system_type *fs_type, int flags,
d2d1ea93069bd7 Al Viro             2010-07-25  110  		       const char *de=
v_name, void *data)
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  111  {
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  112  	struct super_block *sb=
 =3D NULL;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  113  	struct inode *inode =
=3D NULL;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  114  	struct dentry *root =
=3D NULL;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  115  	struct v9fs_session_in=
fo *v9ses =3D NULL;
6e195b0f7c8e50 Dominique Martinet  2021-11-02  116  	umode_t mode =3D 0777 =
| S_ISVTX;
bd238fb431f319 Latchesar Ionkov    2007-07-10 @117  	struct p9_fid *fid;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  118  	int retval =3D 0;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  119  =

5d3851530d6d68 Joe Perches         2011-11-28  120  	p9_debug(P9_DEBUG_VFS,=
 "\n");
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  121  =

1dac06b20dcc80 Latchesar Ionkov    2006-01-08  122  	v9ses =3D kzalloc(size=
of(struct v9fs_session_info), GFP_KERNEL);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  123  	if (!v9ses)
d2d1ea93069bd7 Al Viro             2010-07-25  124  		return ERR_PTR(-ENOME=
M);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  125  =

bd238fb431f319 Latchesar Ionkov    2007-07-10  126  	fid =3D v9fs_session_i=
nit(v9ses, dev_name, data);
bd238fb431f319 Latchesar Ionkov    2007-07-10  127  	if (IS_ERR(fid)) {
bd238fb431f319 Latchesar Ionkov    2007-07-10  128  		retval =3D PTR_ERR(fi=
d);
412a19b64ad17f Tejun Heo           2015-06-08  129  		goto free_session;
bd238fb431f319 Latchesar Ionkov    2007-07-10  130  	}
bd238fb431f319 Latchesar Ionkov    2007-07-10  131  =

9249e17fe094d8 David Howells       2012-06-25  132  	sb =3D sget(fs_type, N=
ULL, v9fs_set_super, flags, v9ses);
454e2398be9b9f David Howells       2006-06-23  133  	if (IS_ERR(sb)) {
454e2398be9b9f David Howells       2006-06-23  134  		retval =3D PTR_ERR(sb=
);
f085312204f384 Sripathi Kodi       2010-07-12  135  		goto clunk_fid;
454e2398be9b9f David Howells       2006-06-23  136  	}
aafee43b72863f Bharath Vedartham   2019-05-23  137  	retval =3D v9fs_fill_s=
uper(sb, v9ses, flags);
71304feba33f4b Jan Kara            2017-04-12  138  	if (retval)
71304feba33f4b Jan Kara            2017-04-12  139  		goto release_sb;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  140  =

fb89b45cdfdc8b Dominique Martinet  2014-01-10  141  	if (v9ses->cache =3D=
=3D CACHE_LOOSE || v9ses->cache =3D=3D CACHE_FSCACHE)
98cd3fb0a2c376 Al Viro             2011-01-12  142  		sb->s_d_op =3D &v9fs_=
cached_dentry_operations;
98cd3fb0a2c376 Al Viro             2011-01-12  143  	else
98cd3fb0a2c376 Al Viro             2011-01-12  144  		sb->s_d_op =3D &v9fs_=
dentry_operations;
98cd3fb0a2c376 Al Viro             2011-01-12  145  =

45089142b1497d Aneesh Kumar K.V    2011-07-25  146  	inode =3D v9fs_get_ino=
de(sb, S_IFDIR | mode, 0);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  147  	if (IS_ERR(inode)) {
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  148  		retval =3D PTR_ERR(in=
ode);
887b3ece65be7b Eric Van Hensbergen 2008-05-08  149  		goto release_sb;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  150  	}
df5d8c80f1871d Aneesh Kumar K.V    2011-03-24  151  =

48fde701aff662 Al Viro             2012-01-08  152  	root =3D d_make_root(i=
node);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  153  	if (!root) {
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  154  		retval =3D -ENOMEM;
887b3ece65be7b Eric Van Hensbergen 2008-05-08  155  		goto release_sb;
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  156  	}
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  157  	sb->s_root =3D root;
f085312204f384 Sripathi Kodi       2010-07-12  158  	if (v9fs_proto_dotl(v9=
ses)) {
f085312204f384 Sripathi Kodi       2010-07-12  159  		struct p9_stat_dotl *=
st =3D NULL;
6e195b0f7c8e50 Dominique Martinet  2021-11-02  160  =

f085312204f384 Sripathi Kodi       2010-07-12  161  		st =3D p9_client_geta=
ttr_dotl(fid, P9_STATS_BASIC);
f085312204f384 Sripathi Kodi       2010-07-12  162  		if (IS_ERR(st)) {
f085312204f384 Sripathi Kodi       2010-07-12  163  			retval =3D PTR_ERR(s=
t);
5c25f347a7b00b Aneesh Kumar K.V    2010-08-24  164  			goto release_sb;
f085312204f384 Sripathi Kodi       2010-07-12  165  		}
2b0143b5c986be David Howells       2015-03-17  166  		d_inode(root)->i_ino =
=3D v9fs_qid2ino(&st->qid);
5e3cc1ee1405a7 Hou Tao             2019-01-24  167  		v9fs_stat2inode_dotl(=
st, d_inode(root), 0);
f085312204f384 Sripathi Kodi       2010-07-12  168  		kfree(st);
f085312204f384 Sripathi Kodi       2010-07-12  169  	} else {
f085312204f384 Sripathi Kodi       2010-07-12  170  		struct p9_wstat *st =
=3D NULL;
6e195b0f7c8e50 Dominique Martinet  2021-11-02  171  =

f085312204f384 Sripathi Kodi       2010-07-12  172  		st =3D p9_client_stat=
(fid);
f085312204f384 Sripathi Kodi       2010-07-12  173  		if (IS_ERR(st)) {
f085312204f384 Sripathi Kodi       2010-07-12  174  			retval =3D PTR_ERR(s=
t);
5c25f347a7b00b Aneesh Kumar K.V    2010-08-24  175  			goto release_sb;
f085312204f384 Sripathi Kodi       2010-07-12  176  		}
f085312204f384 Sripathi Kodi       2010-07-12  177  =

2b0143b5c986be David Howells       2015-03-17  178  		d_inode(root)->i_ino =
=3D v9fs_qid2ino(&st->qid);
5e3cc1ee1405a7 Hou Tao             2019-01-24  179  		v9fs_stat2inode(st, d=
_inode(root), sb, 0);
51a87c552dfd42 Eric Van Hensbergen 2008-10-16  180  =

51a87c552dfd42 Eric Van Hensbergen 2008-10-16  181  		p9stat_free(st);
dda6b022f3222f Latchesar Ionkov    2007-11-06  182  		kfree(st);
f085312204f384 Sripathi Kodi       2010-07-12  183  	}
85ff872d3f4a62 Aneesh Kumar K.V    2010-09-28  184  	retval =3D v9fs_get_ac=
l(inode, fid);
85ff872d3f4a62 Aneesh Kumar K.V    2010-09-28  185  	if (retval)
85ff872d3f4a62 Aneesh Kumar K.V    2010-09-28  186  		goto release_sb;
dafbe689736f62 Dominique Martinet  2022-06-12  187  	v9fs_fid_add(root, &fi=
d);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  188  =

5d3851530d6d68 Joe Perches         2011-11-28  189  	p9_debug(P9_DEBUG_VFS,=
 " simple set mount, return 0\n");
d2d1ea93069bd7 Al Viro             2010-07-25  190  	return dget(sb->s_root=
);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  191  =

887b3ece65be7b Eric Van Hensbergen 2008-05-08  192  clunk_fid:
b48dbb998d70b7 Dominique Martinet  2022-06-12  193  	p9_fid_put(fid);
00fbc6dfe7c448 Eric Van Hensbergen 2006-04-10  194  	v9fs_session_close(v9s=
es);
412a19b64ad17f Tejun Heo           2015-06-08  195  free_session:
00fbc6dfe7c448 Eric Van Hensbergen 2006-04-10  196  	kfree(v9ses);
d2d1ea93069bd7 Al Viro             2010-07-25  197  	return ERR_PTR(retval);
df5d8c80f1871d Aneesh Kumar K.V    2011-03-24  198  =

1b5ab3e86712b6 Abhishek Kulkarni   2009-07-19  199  release_sb:
5c25f347a7b00b Aneesh Kumar K.V    2010-08-24  200  	/*
df5d8c80f1871d Aneesh Kumar K.V    2011-03-24  201  	 * we will do the sess=
ion_close and root dentry release
df5d8c80f1871d Aneesh Kumar K.V    2011-03-24  202  	 * in the below call. =
But we need to clunk fid, because we haven't
df5d8c80f1871d Aneesh Kumar K.V    2011-03-24  203  	 * attached the fid to=
 dentry so it won't get clunked
df5d8c80f1871d Aneesh Kumar K.V    2011-03-24  204  	 * automatically.
5c25f347a7b00b Aneesh Kumar K.V    2010-08-24  205  	 */
b48dbb998d70b7 Dominique Martinet  2022-06-12  206  	p9_fid_put(fid);
1b5ab3e86712b6 Abhishek Kulkarni   2009-07-19  207  	deactivate_locked_supe=
r(sb);
d2d1ea93069bd7 Al Viro             2010-07-25  208  	return ERR_PTR(retval);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  209  }
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  210  =


:::::: The code at line 117 was first introduced by commit
:::::: bd238fb431f31989898423c8b6496bc8c4204a86 9p: Reorganization of 9p fi=
le system code

:::::: TO: Latchesar Ionkov <lucho@ionkov.net>
:::::: CC: Eric Van Hensbergen <ericvh@ericvh-desktop.austin.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5962748991673161742==--

