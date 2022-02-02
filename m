Content-Type: multipart/mixed; boundary="===============8544898794326043101=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC bpf-next v2 2/5] bpf: Introduce inherit list for dir tag.
Date: Wed, 02 Feb 2022 17:15:14 +0800
Message-ID: <202202021722.Gftmgh6J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8544898794326043101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220201205534.1962784-3-haoluo@google.com>
References: <20220201205534.1962784-3-haoluo@google.com>
TO: Hao Luo <haoluo@google.com>

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Extend-cgroup-inte=
rface-with-bpf/20220202-045743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220202/202202021722.Gftmgh6J-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/inode.c:71 free_obj_list() error: dereferencing freed memory 'e'
kernel/bpf/inode.c:251 populate_dir() error: uninitialized symbol 'ret'.

vim +/e +71 kernel/bpf/inode.c

b2197755b2633e Daniel Borkmann   2015-10-29   64  =

f6c6ca7ed74437 Hao Luo           2022-02-01   65  static void free_obj_list=
(struct kref *kref)
f6c6ca7ed74437 Hao Luo           2022-02-01   66  {
f6c6ca7ed74437 Hao Luo           2022-02-01   67  	struct obj_list *list;
f6c6ca7ed74437 Hao Luo           2022-02-01   68  	struct bpf_inherit_entry=
 *e;
f6c6ca7ed74437 Hao Luo           2022-02-01   69  =

f6c6ca7ed74437 Hao Luo           2022-02-01   70  	list =3D container_of(kr=
ef, struct obj_list, refcnt);
f6c6ca7ed74437 Hao Luo           2022-02-01  @71  	list_for_each_entry(e, &=
list->list, list) {
f6c6ca7ed74437 Hao Luo           2022-02-01   72  		list_del_rcu(&e->list);
f6c6ca7ed74437 Hao Luo           2022-02-01   73  		bpf_any_put(e->obj, e->=
type);
f6c6ca7ed74437 Hao Luo           2022-02-01   74  		kfree(e);
f6c6ca7ed74437 Hao Luo           2022-02-01   75  	}
f6c6ca7ed74437 Hao Luo           2022-02-01   76  	kfree(list);
f6c6ca7ed74437 Hao Luo           2022-02-01   77  }
f6c6ca7ed74437 Hao Luo           2022-02-01   78  =

b2197755b2633e Daniel Borkmann   2015-10-29   79  static void *bpf_fd_probe=
_obj(u32 ufd, enum bpf_type *type)
b2197755b2633e Daniel Borkmann   2015-10-29   80  {
b2197755b2633e Daniel Borkmann   2015-10-29   81  	void *raw;
b2197755b2633e Daniel Borkmann   2015-10-29   82  =

c9da161c6517ba Daniel Borkmann   2015-11-24   83  	raw =3D bpf_map_get_with=
_uref(ufd);
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   84  	if (!IS_ERR(raw)) {
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   85  		*type =3D BPF_TYPE_MAP;
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   86  		return raw;
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   87  	}
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   88  =

b2197755b2633e Daniel Borkmann   2015-10-29   89  	raw =3D bpf_prog_get(ufd=
);
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   90  	if (!IS_ERR(raw)) {
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   91  		*type =3D BPF_TYPE_PROG;
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   92  		return raw;
b2197755b2633e Daniel Borkmann   2015-10-29   93  	}
b2197755b2633e Daniel Borkmann   2015-10-29   94  =

70ed506c3bbcfa Andrii Nakryiko   2020-03-02   95  	raw =3D bpf_link_get_fro=
m_fd(ufd);
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   96  	if (!IS_ERR(raw)) {
70ed506c3bbcfa Andrii Nakryiko   2020-03-02   97  		*type =3D BPF_TYPE_LINK;
b2197755b2633e Daniel Borkmann   2015-10-29   98  		return raw;
b2197755b2633e Daniel Borkmann   2015-10-29   99  	}
b2197755b2633e Daniel Borkmann   2015-10-29  100  =

70ed506c3bbcfa Andrii Nakryiko   2020-03-02  101  	return ERR_PTR(-EINVAL);
70ed506c3bbcfa Andrii Nakryiko   2020-03-02  102  }
70ed506c3bbcfa Andrii Nakryiko   2020-03-02  103  =

b2197755b2633e Daniel Borkmann   2015-10-29  104  static const struct inode=
_operations bpf_dir_iops;
b2197755b2633e Daniel Borkmann   2015-10-29  105  =

b2197755b2633e Daniel Borkmann   2015-10-29  106  static const struct inode=
_operations bpf_prog_iops =3D { };
b2197755b2633e Daniel Borkmann   2015-10-29  107  static const struct inode=
_operations bpf_map_iops  =3D { };
70ed506c3bbcfa Andrii Nakryiko   2020-03-02  108  static const struct inode=
_operations bpf_link_iops  =3D { };
b2197755b2633e Daniel Borkmann   2015-10-29  109  =

f6c6ca7ed74437 Hao Luo           2022-02-01  110  static int bpf_mkprog(str=
uct dentry *dentry, umode_t mode, void *arg);
f6c6ca7ed74437 Hao Luo           2022-02-01  111  static int bpf_mkmap(stru=
ct dentry *dentry, umode_t mode, void *arg);
f6c6ca7ed74437 Hao Luo           2022-02-01  112  static int bpf_mklink(str=
uct dentry *dentry, umode_t mode, void *arg);
f6c6ca7ed74437 Hao Luo           2022-02-01  113  =

b2197755b2633e Daniel Borkmann   2015-10-29  114  static struct inode *bpf_=
get_inode(struct super_block *sb,
b2197755b2633e Daniel Borkmann   2015-10-29  115  				   const struct inode=
 *dir,
b2197755b2633e Daniel Borkmann   2015-10-29  116  				   umode_t mode)
b2197755b2633e Daniel Borkmann   2015-10-29  117  {
b2197755b2633e Daniel Borkmann   2015-10-29  118  	struct inode *inode;
b2197755b2633e Daniel Borkmann   2015-10-29  119  =

b2197755b2633e Daniel Borkmann   2015-10-29  120  	switch (mode & S_IFMT) {
b2197755b2633e Daniel Borkmann   2015-10-29  121  	case S_IFDIR:
b2197755b2633e Daniel Borkmann   2015-10-29  122  	case S_IFREG:
0f98621bef5d2b Daniel Borkmann   2016-10-29  123  	case S_IFLNK:
b2197755b2633e Daniel Borkmann   2015-10-29  124  		break;
b2197755b2633e Daniel Borkmann   2015-10-29  125  	default:
b2197755b2633e Daniel Borkmann   2015-10-29  126  		return ERR_PTR(-EINVAL);
b2197755b2633e Daniel Borkmann   2015-10-29  127  	}
b2197755b2633e Daniel Borkmann   2015-10-29  128  =

b2197755b2633e Daniel Borkmann   2015-10-29  129  	inode =3D new_inode(sb);
b2197755b2633e Daniel Borkmann   2015-10-29  130  	if (!inode)
b2197755b2633e Daniel Borkmann   2015-10-29  131  		return ERR_PTR(-ENOSPC);
b2197755b2633e Daniel Borkmann   2015-10-29  132  =

b2197755b2633e Daniel Borkmann   2015-10-29  133  	inode->i_ino =3D get_nex=
t_ino();
078cd8279e6599 Deepa Dinamani    2016-09-14  134  	inode->i_atime =3D curre=
nt_time(inode);
b2197755b2633e Daniel Borkmann   2015-10-29  135  	inode->i_mtime =3D inode=
->i_atime;
b2197755b2633e Daniel Borkmann   2015-10-29  136  	inode->i_ctime =3D inode=
->i_atime;
b2197755b2633e Daniel Borkmann   2015-10-29  137  =

21cb47be6fb9ec Christian Brauner 2021-01-21  138  	inode_init_owner(&init_u=
ser_ns, inode, dir, mode);
b2197755b2633e Daniel Borkmann   2015-10-29  139  =

b2197755b2633e Daniel Borkmann   2015-10-29  140  	return inode;
b2197755b2633e Daniel Borkmann   2015-10-29  141  }
b2197755b2633e Daniel Borkmann   2015-10-29  142  =

b2197755b2633e Daniel Borkmann   2015-10-29  143  static int bpf_inode_type=
(const struct inode *inode, enum bpf_type *type)
b2197755b2633e Daniel Borkmann   2015-10-29  144  {
b2197755b2633e Daniel Borkmann   2015-10-29  145  	*type =3D BPF_TYPE_UNSPE=
C;
b2197755b2633e Daniel Borkmann   2015-10-29  146  	if (inode->i_op =3D=3D &=
bpf_prog_iops)
b2197755b2633e Daniel Borkmann   2015-10-29  147  		*type =3D BPF_TYPE_PROG;
b2197755b2633e Daniel Borkmann   2015-10-29  148  	else if (inode->i_op =3D=
=3D &bpf_map_iops)
b2197755b2633e Daniel Borkmann   2015-10-29  149  		*type =3D BPF_TYPE_MAP;
70ed506c3bbcfa Andrii Nakryiko   2020-03-02  150  	else if (inode->i_op =3D=
=3D &bpf_link_iops)
70ed506c3bbcfa Andrii Nakryiko   2020-03-02  151  		*type =3D BPF_TYPE_LINK;
b2197755b2633e Daniel Borkmann   2015-10-29  152  	else
b2197755b2633e Daniel Borkmann   2015-10-29  153  		return -EACCES;
b2197755b2633e Daniel Borkmann   2015-10-29  154  =

b2197755b2633e Daniel Borkmann   2015-10-29  155  	return 0;
b2197755b2633e Daniel Borkmann   2015-10-29  156  }
b2197755b2633e Daniel Borkmann   2015-10-29  157  =

3a2ad553a70d36 Hao Luo           2022-02-01  158  static struct bpf_dir_tag=
 *inode_tag(const struct inode *inode)
3a2ad553a70d36 Hao Luo           2022-02-01  159  {
3a2ad553a70d36 Hao Luo           2022-02-01  160  	if (unlikely(!S_ISDIR(in=
ode->i_mode)))
3a2ad553a70d36 Hao Luo           2022-02-01  161  		return NULL;
3a2ad553a70d36 Hao Luo           2022-02-01  162  =

3a2ad553a70d36 Hao Luo           2022-02-01  163  	return inode->i_private;
3a2ad553a70d36 Hao Luo           2022-02-01  164  }
3a2ad553a70d36 Hao Luo           2022-02-01  165  =

3a2ad553a70d36 Hao Luo           2022-02-01  166  /* tag_dir_inode - tag a =
newly created directory.
3a2ad553a70d36 Hao Luo           2022-02-01  167   * @tag: tag of parent di=
rectory
3a2ad553a70d36 Hao Luo           2022-02-01  168   * @dentry: dentry of the=
 new directory
3a2ad553a70d36 Hao Luo           2022-02-01  169   * @inode: inode of the n=
ew directory
3a2ad553a70d36 Hao Luo           2022-02-01  170   *
3a2ad553a70d36 Hao Luo           2022-02-01  171   * Called from bpf_mkdir.
3a2ad553a70d36 Hao Luo           2022-02-01  172   */
3a2ad553a70d36 Hao Luo           2022-02-01  173  static int tag_dir_inode(=
const struct bpf_dir_tag *tag,
3a2ad553a70d36 Hao Luo           2022-02-01  174  			 const struct dentry *=
dentry, struct inode *inode)
3a2ad553a70d36 Hao Luo           2022-02-01  175  {
3a2ad553a70d36 Hao Luo           2022-02-01  176  	struct bpf_dir_tag *t;
3a2ad553a70d36 Hao Luo           2022-02-01  177  	struct kernfs_node *kn;
3a2ad553a70d36 Hao Luo           2022-02-01  178  =

3a2ad553a70d36 Hao Luo           2022-02-01  179  	WARN_ON(tag->type !=3D B=
PF_DIR_KERNFS_REP);
3a2ad553a70d36 Hao Luo           2022-02-01  180  =

3a2ad553a70d36 Hao Luo           2022-02-01  181  	/* kn is put at tag deal=
location. */
3a2ad553a70d36 Hao Luo           2022-02-01  182  	kn =3D kernfs_find_and_g=
et_ns(tag->private, dentry->d_name.name, NULL);
3a2ad553a70d36 Hao Luo           2022-02-01  183  	if (unlikely(!kn))
3a2ad553a70d36 Hao Luo           2022-02-01  184  		return -ENOENT;
3a2ad553a70d36 Hao Luo           2022-02-01  185  =

3a2ad553a70d36 Hao Luo           2022-02-01  186  	if (unlikely(kernfs_type=
(kn) !=3D KERNFS_DIR)) {
3a2ad553a70d36 Hao Luo           2022-02-01  187  		kernfs_put(kn);
3a2ad553a70d36 Hao Luo           2022-02-01  188  		return -EPERM;
3a2ad553a70d36 Hao Luo           2022-02-01  189  	}
3a2ad553a70d36 Hao Luo           2022-02-01  190  =

3a2ad553a70d36 Hao Luo           2022-02-01  191  	t =3D kzalloc(sizeof(str=
uct bpf_dir_tag), GFP_KERNEL | __GFP_NOWARN);
3a2ad553a70d36 Hao Luo           2022-02-01  192  	if (unlikely(!t)) {
3a2ad553a70d36 Hao Luo           2022-02-01  193  		kernfs_put(kn);
3a2ad553a70d36 Hao Luo           2022-02-01  194  		return -ENOMEM;
3a2ad553a70d36 Hao Luo           2022-02-01  195  	}
3a2ad553a70d36 Hao Luo           2022-02-01  196  =

3a2ad553a70d36 Hao Luo           2022-02-01  197  	t->type =3D tag->type;
f6c6ca7ed74437 Hao Luo           2022-02-01  198  	t->inherit_objects =3D t=
ag->inherit_objects;
f6c6ca7ed74437 Hao Luo           2022-02-01  199  	kref_get(&t->inherit_obj=
ects->refcnt);
3a2ad553a70d36 Hao Luo           2022-02-01  200  	t->private =3D kn;
3a2ad553a70d36 Hao Luo           2022-02-01  201  =

3a2ad553a70d36 Hao Luo           2022-02-01  202  	inode->i_private =3D t;
3a2ad553a70d36 Hao Luo           2022-02-01  203  	return 0;
3a2ad553a70d36 Hao Luo           2022-02-01  204  }
3a2ad553a70d36 Hao Luo           2022-02-01  205  =

f6c6ca7ed74437 Hao Luo           2022-02-01  206  /* populate_dir - populat=
e directory with bpf objects in a tag's
f6c6ca7ed74437 Hao Luo           2022-02-01  207   * inherit_objects.
f6c6ca7ed74437 Hao Luo           2022-02-01  208   * @dir: dentry of the di=
rectory.
f6c6ca7ed74437 Hao Luo           2022-02-01  209   * @inode: inode of the d=
irecotry.
f6c6ca7ed74437 Hao Luo           2022-02-01  210   *
f6c6ca7ed74437 Hao Luo           2022-02-01  211   * Called from mkdir. Mus=
t be called after dentry has been finalized.
f6c6ca7ed74437 Hao Luo           2022-02-01  212   */
f6c6ca7ed74437 Hao Luo           2022-02-01  213  static int populate_dir(s=
truct dentry *dir, struct inode *inode)
f6c6ca7ed74437 Hao Luo           2022-02-01  214  {
f6c6ca7ed74437 Hao Luo           2022-02-01  215  	struct bpf_dir_tag *tag =
=3D inode_tag(inode);
f6c6ca7ed74437 Hao Luo           2022-02-01  216  	struct bpf_inherit_entry=
 *e;
f6c6ca7ed74437 Hao Luo           2022-02-01  217  	struct dentry *child;
f6c6ca7ed74437 Hao Luo           2022-02-01  218  	int ret;
f6c6ca7ed74437 Hao Luo           2022-02-01  219  =

f6c6ca7ed74437 Hao Luo           2022-02-01  220  	rcu_read_lock();
f6c6ca7ed74437 Hao Luo           2022-02-01  221  	list_for_each_entry_rcu(=
e, &tag->inherit_objects->list, list) {
f6c6ca7ed74437 Hao Luo           2022-02-01  222  		child =3D lookup_one_le=
n_unlocked(e->name.name, dir,
f6c6ca7ed74437 Hao Luo           2022-02-01  223  						strlen(e->name.name=
));
f6c6ca7ed74437 Hao Luo           2022-02-01  224  		if (unlikely(IS_ERR(chi=
ld))) {
f6c6ca7ed74437 Hao Luo           2022-02-01  225  			ret =3D PTR_ERR(child);
f6c6ca7ed74437 Hao Luo           2022-02-01  226  			break;
f6c6ca7ed74437 Hao Luo           2022-02-01  227  		}
f6c6ca7ed74437 Hao Luo           2022-02-01  228  =

f6c6ca7ed74437 Hao Luo           2022-02-01  229  		switch (e->type) {
f6c6ca7ed74437 Hao Luo           2022-02-01  230  		case BPF_TYPE_PROG:
f6c6ca7ed74437 Hao Luo           2022-02-01  231  			ret =3D bpf_mkprog(chi=
ld, e->mode, e->obj);
f6c6ca7ed74437 Hao Luo           2022-02-01  232  			break;
f6c6ca7ed74437 Hao Luo           2022-02-01  233  		case BPF_TYPE_MAP:
f6c6ca7ed74437 Hao Luo           2022-02-01  234  			ret =3D bpf_mkmap(chil=
d, e->mode, e->obj);
f6c6ca7ed74437 Hao Luo           2022-02-01  235  			break;
f6c6ca7ed74437 Hao Luo           2022-02-01  236  		case BPF_TYPE_LINK:
f6c6ca7ed74437 Hao Luo           2022-02-01  237  			ret =3D bpf_mklink(chi=
ld, e->mode, e->obj);
f6c6ca7ed74437 Hao Luo           2022-02-01  238  			break;
f6c6ca7ed74437 Hao Luo           2022-02-01  239  		default:
f6c6ca7ed74437 Hao Luo           2022-02-01  240  			ret =3D -EPERM;
f6c6ca7ed74437 Hao Luo           2022-02-01  241  			break;
f6c6ca7ed74437 Hao Luo           2022-02-01  242  		}
f6c6ca7ed74437 Hao Luo           2022-02-01  243  		dput(child);
f6c6ca7ed74437 Hao Luo           2022-02-01  244  		if (ret)
f6c6ca7ed74437 Hao Luo           2022-02-01  245  			break;
f6c6ca7ed74437 Hao Luo           2022-02-01  246  =

f6c6ca7ed74437 Hao Luo           2022-02-01  247  		/* To match bpf_any_put=
 in bpf_free_inode. */
f6c6ca7ed74437 Hao Luo           2022-02-01  248  		bpf_any_get(e->obj, e->=
type);
f6c6ca7ed74437 Hao Luo           2022-02-01  249  	}
f6c6ca7ed74437 Hao Luo           2022-02-01  250  	rcu_read_unlock();
f6c6ca7ed74437 Hao Luo           2022-02-01 @251  	return ret;
f6c6ca7ed74437 Hao Luo           2022-02-01  252  }
f6c6ca7ed74437 Hao Luo           2022-02-01  253  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8544898794326043101==--

