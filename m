Content-Type: multipart/mixed; boundary="===============6616042266992779292=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3660/4301] fs/gfs2/inode.c:192 gfs2_inode_lookup() error: we previously assumed 'gl' could be null (see line 169)
Date: Tue, 30 Nov 2021 18:28:07 +0800
Message-ID: <202111301821.8ginBraG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6616042266992779292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   34f255a1e91ab44ff8926cf8294ff9144e62e861
commit: cfdb9692082c42515edc5a921481826a1573d329 [3660/4301] gfs2: Rework g=
fs2_inode_lookup
:::::: branch date: 2 hours ago
:::::: commit date: 22 hours ago
config: powerpc64-randconfig-m031-20211129 (https://download.01.org/0day-ci=
/archive/20211130/202111301821.8ginBraG-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/gfs2/inode.c:192 gfs2_inode_lookup() error: we previously assumed 'gl' c=
ould be null (see line 169)

Old smatch warnings:
fs/gfs2/inode.c:343 gfs2_lookupi() warn: passing zero to 'ERR_PTR'

vim +/gl +192 fs/gfs2/inode.c

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29   91  =

194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09   92  /**
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09   93   * =
gfs2_inode_lookup - Lookup an inode
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09   94   * =
@sb: The super block
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09   95   * =
@type: The type of the inode
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14   96   * =
@no_addr: The inode number
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14   97   * =
@no_formal_ino: The inode generation number
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14   98   * =
@blktype: Requested block type (GFS2_BLKST_DINODE or GFS2_BLKST_UNLINKED;
61b91cfdc6c0c4 fs/gfs2/inode.c     Andreas Gruenbacher 2017-08-01   99   * =
          GFS2_BLKST_FREE to indicate not to verify)
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  100   *
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  101   * =
If @type is DT_UNKNOWN, the inode type is fetched from disk.
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  102   *
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  103   * =
If @blktype is anything other than GFS2_BLKST_FREE (which is used as a
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  104   * =
placeholder because it doesn't otherwise make sense), the on-disk block type
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  105   * =
is verified to be @blktype.
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  106   *
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  107   * =
When @no_formal_ino is non-zero, this function will return ERR_PTR(-ESTALE)
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  108   * =
if it detects that @no_formal_ino doesn't match the actual inode generation
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  109   * =
number.  However, it doesn't always know unless @type is DT_UNKNOWN.
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  110   *
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  111   * =
Returns: A VFS inode, or an error
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  112   */
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  113  =

194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  114  str=
uct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  115  			=
	u64 no_addr, u64 no_formal_ino,
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  116  			=
	unsigned int blktype)
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  117  {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  118  	st=
ruct gfs2_sbd *sdp =3D sb->s_fs_info;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  119  	st=
ruct gfs2_glock *gl =3D NULL;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  120  	st=
ruct inode *inode;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  121  	st=
ruct gfs2_inode *ip;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  122  	st=
ruct gfs2_holder gh;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  123  	in=
t error;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  124  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  125  	gf=
s2_holder_mark_uninitialized(&gh);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  126  	in=
ode =3D ilookup5(sb, no_addr, iget_test, &no_addr);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  127  	if=
 (!inode && (type =3D=3D DT_UNKNOWN || blktype !=3D GFS2_BLKST_FREE)) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  128  		e=
rror =3D gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &gl);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  129  		i=
f (unlikely(error))
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  130  			=
goto fail;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  131  =

3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  132  		/*
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  133  		 =
* The GL_SKIP flag indicates to skip reading the inode
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  134  		 =
* block.  We read the inode when instantiating it
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  135  		 =
* after possibly checking the block type.
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  136  		 =
*/
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  137  		e=
rror =3D gfs2_glock_nq_init(gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  138  		i=
f (error)
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-24  139  			=
goto fail;
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  140  =

b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  141  		e=
rror =3D -ESTALE;
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  142  		i=
f (no_formal_ino &&
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  143  		 =
   gfs2_inode_already_deleted(gl, no_formal_ino))
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  144  			=
goto fail;
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  145  =

3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  146  		i=
f (blktype !=3D GFS2_BLKST_FREE) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  147  			=
error =3D gfs2_check_blk_type(sdp, no_addr, blktype);
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  148  			=
if (error)
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-24  149  			=
	goto fail;
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  150  		}
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  151  	}
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher 2016-06-14  152  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  153  	wh=
ile (!inode) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  154  		i=
node =3D iget5_locked(sb, no_addr, iget_test, iget_set, &no_addr);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  155  		e=
rror =3D -ENOMEM;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  156  		i=
f (!inode)
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  157  			=
goto fail;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  158  		i=
f (is_bad_inode(inode)) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  159  			=
iput(inode);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  160  			=
inode =3D NULL;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  161  		}
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  162  	}
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  163  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  164  	ip=
 =3D GFS2_I(inode);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  165  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  166  	if=
 (inode->i_state & I_NEW) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  167  		s=
truct gfs2_glock *io_gl;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  168  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29 @169  		i=
f (!gl) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  170  			=
error =3D gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &gl);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  171  			=
if (unlikely(error))
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-24  172  			=
	goto fail;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  173  		}
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  174  		f=
lush_delayed_work(&gl->gl_work);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  175  		s=
et_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  176  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  177  		e=
rror =3D gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  178  		i=
f (unlikely(error))
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  179  			=
goto fail;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  180  		i=
f (blktype !=3D GFS2_BLKST_UNLINKED)
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  181  			=
gfs2_cancel_delete_work(io_gl);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  182  		e=
rror =3D gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  183  		g=
fs2_glock_put(io_gl);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  184  		i=
f (unlikely(error))
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  185  			=
goto fail;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  186  =

2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  187  		/=
* Lowest possible timestamp; will be overwritten in gfs2_dinode_in. */
2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  188  		i=
node->i_atime.tv_sec =3D 1LL << (8 * sizeof(inode->i_atime.tv_sec) - 1);
2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  189  		i=
node->i_atime.tv_nsec =3D 0;
2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  190  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  191  		i=
p->i_gl =3D gl;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29 @192  		g=
lock_set_object(gl, ip);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  193  =

194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  194  		i=
f (type =3D=3D DT_UNKNOWN) {
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  195  			=
/* Inode glock must be locked already */
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  196  			=
error =3D gfs2_instantiate(&gh);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  197  			=
if (error) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  198  			=
	glock_clear_object(gl, ip);
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-24  199  			=
	goto fail;
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  200  			}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  201  		}=
 else {
2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  202  			=
ip->i_no_formal_ino =3D no_formal_ino;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  203  			=
inode->i_mode =3D DT2IF(type);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  204  		}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  205  =

cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  206  		i=
f (gfs2_holder_initialized(&gh))
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  207  			=
gfs2_glock_dq_uninit(&gh);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  208  		g=
lock_set_object(io_gl, ip);
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  209  =

194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  210  		g=
fs2_set_iop(inode);
a44a8c9c8df1fa fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  211  		u=
nlock_new_inode(inode);
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  212  	}
332f51d7db13ff fs/gfs2/inode.c     Andreas Gruenbacher 2016-09-26  213  =

b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  214  	if=
 (no_formal_ino && ip->i_no_formal_ino &&
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  215  	  =
  no_formal_ino !=3D ip->i_no_formal_ino) {
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-15  216  		i=
put(inode);
a44a8c9c8df1fa fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  217  		r=
eturn ERR_PTR(-ESTALE);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  218  	}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  219  =

194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  220  	re=
turn inode;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  221  =

40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher 2020-01-24  222  fai=
l:
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  223  	if=
 (inode) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  224  		i=
f (gfs2_holder_initialized(&ip->i_iopen_gh))
763766c0571ea1 fs/gfs2/inode.c     Bob Peterson        2021-09-29  225  			=
gfs2_glock_dq_uninit(&ip->i_iopen_gh);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  226  		i=
f (inode->i_state & I_NEW) {
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  227  			=
make_bad_inode(inode);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  228  			=
unlock_new_inode(inode);
763766c0571ea1 fs/gfs2/inode.c     Bob Peterson        2021-09-29  229  		}
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  230  		i=
put(inode);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  231  	}
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  232  	if=
 (gfs2_holder_initialized(&gh))
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  233  		g=
fs2_glock_dq_uninit(&gh);
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  234  	if=
 (gl)
cfdb9692082c42 fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-29  235  		g=
fs2_glock_put(gl);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  236  	re=
turn ERR_PTR(error);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  237  }
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  238  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6616042266992779292==--

