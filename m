Content-Type: multipart/mixed; boundary="===============7775218032815452498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 11/23] fs: Add /proc/namespaces/ directory
Date: Wed, 05 Aug 2020 12:17:44 +0800
Message-ID: <202008051259.y0P0ITnS%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7775218032815452498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <159611041929.535980.14513096920129728440.stgit@localhost.lo=
caldomain>
References: <159611041929.535980.14513096920129728440.stgit@localhost.loc=
aldomain>
TO: Kirill Tkhai <ktkhai@virtuozzo.com>
TO: viro(a)zeniv.linux.org.uk
TO: adobriyan(a)gmail.com
TO: davem(a)davemloft.net
TO: ebiederm(a)xmission.com
TO: akpm(a)linux-foundation.org
TO: christian.brauner(a)ubuntu.com
TO: areber(a)redhat.com
TO: serge(a)hallyn.com
TO: linux-kernel(a)vger.kernel.org
TO: linux-fsdevel(a)vger.kernel.org

Hi Kirill,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20200729]
[also build test WARNING on v5.8]
[cannot apply to cgroup/for-next tip/timers/core net-next/master sparc-next=
/master net/master linus/master v5.8-rc7 v5.8-rc6 v5.8-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kirill-Tkhai/proc-Introduc=
e-proc-namespaces-directory-to-expose-namespaces-lineary/20200730-200346
base:    04b4571786305a76ad81757bbec78eb16a5de582
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/proc/task_namespaces.c:61:8: warning: Variable 'error' is reassigned =
a value before the old one has been used. [redundantAssignment]
    error =3D ns_get_path(&ns_path, task, ns_ops);
          ^
   fs/proc/task_namespaces.c:49:0: note: Variable 'error' is reassigned a v=
alue before the old one has been used.
    int error =3D -EACCES;
   ^
   fs/proc/task_namespaces.c:61:8: note: Variable 'error' is reassigned a v=
alue before the old one has been used.
    error =3D ns_get_path(&ns_path, task, ns_ops);
          ^
>> fs/proc/task_namespaces.c:172:6: warning: Variable 'res' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    res =3D proc_ns_instantiate(dentry, task, *entry);
        ^
   fs/proc/task_namespaces.c:157:0: note: Variable 'res' is reassigned a va=
lue before the old one has been used.
    struct dentry *res =3D ERR_PTR(-ENOENT);
   ^
   fs/proc/task_namespaces.c:172:6: note: Variable 'res' is reassigned a va=
lue before the old one has been used.
    res =3D proc_ns_instantiate(dentry, task, *entry);
        ^
>> fs/proc/namespaces.c:24:16: warning: Either the condition '!p' is redund=
ant or there is overflow in pointer subtraction. [nullPointerArithmeticRedu=
ndantCheck]
    *type_len =3D p - name;
                  ^
   fs/proc/namespaces.c:25:6: note: Assuming that condition '!p' is not red=
undant
    if (!p || p =3D=3D name)
        ^
   fs/proc/namespaces.c:24:16: note: Null pointer subtraction
    *type_len =3D p - name;
                  ^
>> fs/proc/namespaces.c:153:7: warning: Variable 'ret' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
     ret =3D __ns_get_path(&path, ns);
         ^
   fs/proc/namespaces.c:148:7: note: Variable 'ret' is reassigned a value b=
efore the old one has been used.
     ret =3D -ENOENT;
         ^
   fs/proc/namespaces.c:153:7: note: Variable 'ret' is reassigned a value b=
efore the old one has been used.
     ret =3D __ns_get_path(&path, ns);
         ^

# https://github.com/0day-ci/linux/commit/5b434887cc768d2f4c4867c792d69faa6=
62b3cc9
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5b434887cc768d2f4c4867c792d69faa662b3cc9
vim +24 fs/proc/namespaces.c

5b434887cc768d Kirill Tkhai 2020-07-30   15  =

5b434887cc768d Kirill Tkhai 2020-07-30   16  static int parse_namespace_den=
try_name(const struct dentry *dentry,
5b434887cc768d Kirill Tkhai 2020-07-30   17  		const char **type, unsigned =
int *type_len, unsigned int *inum)
5b434887cc768d Kirill Tkhai 2020-07-30   18  {
5b434887cc768d Kirill Tkhai 2020-07-30   19  	const char *p, *name;
5b434887cc768d Kirill Tkhai 2020-07-30   20  	int count;
5b434887cc768d Kirill Tkhai 2020-07-30   21  =

5b434887cc768d Kirill Tkhai 2020-07-30   22  	*type =3D name =3D dentry->d_=
name.name;
5b434887cc768d Kirill Tkhai 2020-07-30   23  	p =3D strchr(name, ':');
5b434887cc768d Kirill Tkhai 2020-07-30  @24  	*type_len =3D p - name;
5b434887cc768d Kirill Tkhai 2020-07-30   25  	if (!p || p =3D=3D name)
5b434887cc768d Kirill Tkhai 2020-07-30   26  		return -ENOENT;
5b434887cc768d Kirill Tkhai 2020-07-30   27  =

5b434887cc768d Kirill Tkhai 2020-07-30   28  	p +=3D 1;
5b434887cc768d Kirill Tkhai 2020-07-30   29  	if (sscanf(p, "[%u]%n", inum,=
 &count) !=3D 1 || *(p + count) !=3D '\0' ||
5b434887cc768d Kirill Tkhai 2020-07-30   30  	    *inum < PROC_NS_MIN_INO)
5b434887cc768d Kirill Tkhai 2020-07-30   31  		return -ENOENT;
5b434887cc768d Kirill Tkhai 2020-07-30   32  =

5b434887cc768d Kirill Tkhai 2020-07-30   33  	return 0;
5b434887cc768d Kirill Tkhai 2020-07-30   34  }
5b434887cc768d Kirill Tkhai 2020-07-30   35  =

5b434887cc768d Kirill Tkhai 2020-07-30   36  static struct ns_common *get_n=
amespace_by_dentry(struct pid_namespace *pid_ns,
5b434887cc768d Kirill Tkhai 2020-07-30   37  						 const struct dentry *de=
ntry)
5b434887cc768d Kirill Tkhai 2020-07-30   38  {
5b434887cc768d Kirill Tkhai 2020-07-30   39  	unsigned int type_len, inum, =
p_inum;
5b434887cc768d Kirill Tkhai 2020-07-30   40  	struct user_namespace *user_n=
s;
5b434887cc768d Kirill Tkhai 2020-07-30   41  	struct ns_common *ns;
5b434887cc768d Kirill Tkhai 2020-07-30   42  	const char *type;
5b434887cc768d Kirill Tkhai 2020-07-30   43  =

5b434887cc768d Kirill Tkhai 2020-07-30   44  	if (parse_namespace_dentry_na=
me(dentry, &type, &type_len, &inum) < 0)
5b434887cc768d Kirill Tkhai 2020-07-30   45  		return NULL;
5b434887cc768d Kirill Tkhai 2020-07-30   46  =

5b434887cc768d Kirill Tkhai 2020-07-30   47  	p_inum =3D inum - 1;
5b434887cc768d Kirill Tkhai 2020-07-30   48  	ns =3D ns_get_next(&p_inum);
5b434887cc768d Kirill Tkhai 2020-07-30   49  	if (!ns)
5b434887cc768d Kirill Tkhai 2020-07-30   50  		return NULL;
5b434887cc768d Kirill Tkhai 2020-07-30   51  =

5b434887cc768d Kirill Tkhai 2020-07-30   52  	if (ns->inum !=3D inum || str=
ncmp(type, ns->ops->name, type_len) !=3D 0 ||
5b434887cc768d Kirill Tkhai 2020-07-30   53  	    ns->ops->name[type_len] !=
=3D '\0') {
5b434887cc768d Kirill Tkhai 2020-07-30   54  		ns->ops->put(ns);
5b434887cc768d Kirill Tkhai 2020-07-30   55  		return NULL;
5b434887cc768d Kirill Tkhai 2020-07-30   56  	}
5b434887cc768d Kirill Tkhai 2020-07-30   57  =

5b434887cc768d Kirill Tkhai 2020-07-30   58  	if (ns->ops !=3D &userns_oper=
ations)
5b434887cc768d Kirill Tkhai 2020-07-30   59  		user_ns =3D ns->ops->owner(n=
s);
5b434887cc768d Kirill Tkhai 2020-07-30   60  	else
5b434887cc768d Kirill Tkhai 2020-07-30   61  		user_ns =3D container_of(ns,=
 struct user_namespace, ns);
5b434887cc768d Kirill Tkhai 2020-07-30   62  =

5b434887cc768d Kirill Tkhai 2020-07-30   63  	if (!in_userns(pid_ns->user_n=
s, user_ns)) {
5b434887cc768d Kirill Tkhai 2020-07-30   64  		ns->ops->put(ns);
5b434887cc768d Kirill Tkhai 2020-07-30   65  		return NULL;
5b434887cc768d Kirill Tkhai 2020-07-30   66  	}
5b434887cc768d Kirill Tkhai 2020-07-30   67  =

5b434887cc768d Kirill Tkhai 2020-07-30   68  	return ns;
5b434887cc768d Kirill Tkhai 2020-07-30   69  }
5b434887cc768d Kirill Tkhai 2020-07-30   70  =

5b434887cc768d Kirill Tkhai 2020-07-30   71  static struct dentry *proc_nam=
espace_instantiate(struct dentry *dentry,
5b434887cc768d Kirill Tkhai 2020-07-30   72  		struct task_struct *task, co=
nst void *ptr);
5b434887cc768d Kirill Tkhai 2020-07-30   73  =

5b434887cc768d Kirill Tkhai 2020-07-30   74  static struct dentry *proc_nam=
espaces_lookup(struct inode *dir, struct dentry *dentry,
5b434887cc768d Kirill Tkhai 2020-07-30   75  					     unsigned int flags)
5b434887cc768d Kirill Tkhai 2020-07-30   76  {
5b434887cc768d Kirill Tkhai 2020-07-30   77  	struct pid_namespace *pid_ns =
=3D proc_pid_ns(dir->i_sb);
5b434887cc768d Kirill Tkhai 2020-07-30   78  	struct task_struct *task;
5b434887cc768d Kirill Tkhai 2020-07-30   79  	struct ns_common *ns;
5b434887cc768d Kirill Tkhai 2020-07-30   80  =

5b434887cc768d Kirill Tkhai 2020-07-30   81  	ns =3D get_namespace_by_dentr=
y(pid_ns, dentry);
5b434887cc768d Kirill Tkhai 2020-07-30   82  	if (!ns)
5b434887cc768d Kirill Tkhai 2020-07-30   83  		return ERR_PTR(-ENOENT);
5b434887cc768d Kirill Tkhai 2020-07-30   84  =

5b434887cc768d Kirill Tkhai 2020-07-30   85  	read_lock(&tasklist_lock);
5b434887cc768d Kirill Tkhai 2020-07-30   86  	task =3D get_task_struct(pid_=
ns->child_reaper);
5b434887cc768d Kirill Tkhai 2020-07-30   87  	read_unlock(&tasklist_lock);
5b434887cc768d Kirill Tkhai 2020-07-30   88  =

5b434887cc768d Kirill Tkhai 2020-07-30   89  	dentry =3D proc_namespace_ins=
tantiate(dentry, task, ns);
5b434887cc768d Kirill Tkhai 2020-07-30   90  	put_task_struct(task);
5b434887cc768d Kirill Tkhai 2020-07-30   91  	ns->ops->put(ns);
5b434887cc768d Kirill Tkhai 2020-07-30   92  =

5b434887cc768d Kirill Tkhai 2020-07-30   93  	return dentry;
5b434887cc768d Kirill Tkhai 2020-07-30   94  }
5b434887cc768d Kirill Tkhai 2020-07-30   95  =

5b434887cc768d Kirill Tkhai 2020-07-30   96  static int proc_namespaces_per=
mission(struct inode *inode, int mask)
5b434887cc768d Kirill Tkhai 2020-07-30   97  {
5b434887cc768d Kirill Tkhai 2020-07-30   98  	if ((mask & MAY_EXEC) && S_IS=
LNK(inode->i_mode))
5b434887cc768d Kirill Tkhai 2020-07-30   99  		return -EACCES;
5b434887cc768d Kirill Tkhai 2020-07-30  100  =

5b434887cc768d Kirill Tkhai 2020-07-30  101  	return 0;
5b434887cc768d Kirill Tkhai 2020-07-30  102  }
5b434887cc768d Kirill Tkhai 2020-07-30  103  =

5b434887cc768d Kirill Tkhai 2020-07-30  104  static int proc_namespaces_get=
attr(const struct path *path, struct kstat *stat,
5b434887cc768d Kirill Tkhai 2020-07-30  105  				   u32 request_mask, unsig=
ned int query_flags)
5b434887cc768d Kirill Tkhai 2020-07-30  106  {
5b434887cc768d Kirill Tkhai 2020-07-30  107  	struct inode *inode =3D d_ino=
de(path->dentry);
5b434887cc768d Kirill Tkhai 2020-07-30  108  =

5b434887cc768d Kirill Tkhai 2020-07-30  109  	generic_fillattr(inode, stat);
5b434887cc768d Kirill Tkhai 2020-07-30  110  	return 0;
5b434887cc768d Kirill Tkhai 2020-07-30  111  }
5b434887cc768d Kirill Tkhai 2020-07-30  112  =

5b434887cc768d Kirill Tkhai 2020-07-30  113  static const struct inode_oper=
ations proc_namespaces_inode_operations =3D {
5b434887cc768d Kirill Tkhai 2020-07-30  114  	.lookup		=3D proc_namespaces_=
lookup,
5b434887cc768d Kirill Tkhai 2020-07-30  115  	.permission	=3D proc_namespac=
es_permission,
5b434887cc768d Kirill Tkhai 2020-07-30  116  	.getattr	=3D proc_namespaces_=
getattr,
5b434887cc768d Kirill Tkhai 2020-07-30  117  };
5b434887cc768d Kirill Tkhai 2020-07-30  118  =

5b434887cc768d Kirill Tkhai 2020-07-30  119  static int proc_namespaces_rea=
dlink(struct dentry *dentry, char __user *buffer, int buflen)
5b434887cc768d Kirill Tkhai 2020-07-30  120  {
5b434887cc768d Kirill Tkhai 2020-07-30  121  	struct inode *dir =3D dentry-=
>d_parent->d_inode;
5b434887cc768d Kirill Tkhai 2020-07-30  122  	struct pid_namespace *pid_ns =
=3D proc_pid_ns(dir->i_sb);
5b434887cc768d Kirill Tkhai 2020-07-30  123  	struct ns_common *ns;
5b434887cc768d Kirill Tkhai 2020-07-30  124  =

5b434887cc768d Kirill Tkhai 2020-07-30  125  	ns =3D get_namespace_by_dentr=
y(pid_ns, dentry);
5b434887cc768d Kirill Tkhai 2020-07-30  126  	if (!ns)
5b434887cc768d Kirill Tkhai 2020-07-30  127  		return -ENOENT;
5b434887cc768d Kirill Tkhai 2020-07-30  128  	ns->ops->put(ns);
5b434887cc768d Kirill Tkhai 2020-07-30  129  =

5b434887cc768d Kirill Tkhai 2020-07-30  130  	/* proc_namespaces_readdir() =
creates dentry names in namespace format */
5b434887cc768d Kirill Tkhai 2020-07-30  131  	return readlink_copy(buffer, =
buflen, dentry->d_iname);
5b434887cc768d Kirill Tkhai 2020-07-30  132  }
5b434887cc768d Kirill Tkhai 2020-07-30  133  =

5b434887cc768d Kirill Tkhai 2020-07-30  134  int __ns_get_path(struct path =
*path, struct ns_common *ns);
5b434887cc768d Kirill Tkhai 2020-07-30  135  =

5b434887cc768d Kirill Tkhai 2020-07-30  136  static const char *proc_namesp=
aces_getlink(struct dentry *dentry,
5b434887cc768d Kirill Tkhai 2020-07-30  137  				struct inode *inode, struc=
t delayed_call *done)
5b434887cc768d Kirill Tkhai 2020-07-30  138  {
5b434887cc768d Kirill Tkhai 2020-07-30  139  	struct pid_namespace *pid_ns =
=3D proc_pid_ns(inode->i_sb);
5b434887cc768d Kirill Tkhai 2020-07-30  140  	struct ns_common *ns;
5b434887cc768d Kirill Tkhai 2020-07-30  141  	struct path path;
5b434887cc768d Kirill Tkhai 2020-07-30  142  	int ret;
5b434887cc768d Kirill Tkhai 2020-07-30  143  =

5b434887cc768d Kirill Tkhai 2020-07-30  144  	if (!dentry)
5b434887cc768d Kirill Tkhai 2020-07-30  145  		return ERR_PTR(-ECHILD);
5b434887cc768d Kirill Tkhai 2020-07-30  146  =

5b434887cc768d Kirill Tkhai 2020-07-30  147  	while (1) {
5b434887cc768d Kirill Tkhai 2020-07-30  148  		ret =3D -ENOENT;
5b434887cc768d Kirill Tkhai 2020-07-30  149  		ns =3D get_namespace_by_dent=
ry(pid_ns, dentry);
5b434887cc768d Kirill Tkhai 2020-07-30  150  		if (!ns)
5b434887cc768d Kirill Tkhai 2020-07-30  151  			goto out;
5b434887cc768d Kirill Tkhai 2020-07-30  152  =

5b434887cc768d Kirill Tkhai 2020-07-30 @153  		ret =3D __ns_get_path(&path,=
 ns);
5b434887cc768d Kirill Tkhai 2020-07-30  154  		if (ret =3D=3D -EAGAIN)
5b434887cc768d Kirill Tkhai 2020-07-30  155  			continue;
5b434887cc768d Kirill Tkhai 2020-07-30  156  		if (ret)
5b434887cc768d Kirill Tkhai 2020-07-30  157  			goto out;
5b434887cc768d Kirill Tkhai 2020-07-30  158  		break;
5b434887cc768d Kirill Tkhai 2020-07-30  159  	}
5b434887cc768d Kirill Tkhai 2020-07-30  160  =

5b434887cc768d Kirill Tkhai 2020-07-30  161  	ret =3D nd_jump_link(&path);
5b434887cc768d Kirill Tkhai 2020-07-30  162  out:
5b434887cc768d Kirill Tkhai 2020-07-30  163  	return ERR_PTR(ret);
5b434887cc768d Kirill Tkhai 2020-07-30  164  }
5b434887cc768d Kirill Tkhai 2020-07-30  165  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7775218032815452498==--

