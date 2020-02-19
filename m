Content-Type: multipart/mixed; boundary="===============6280031471332339280=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] proc: faster open/read/close with "permanent" files
Date: Wed, 19 Feb 2020 08:29:21 +0300
Message-ID: <20200219052921.GF19641@kadam>
In-Reply-To: <20200216152649.GA2693@avx2>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6280031471332339280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexey,


url:    https://github.com/0day-ci/linux/commits/Alexey-Dobriyan/proc-faste=
r-open-read-close-with-permanent-files/20200218-231203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git modu=
les-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/proc/generic.c:752 remove_proc_subtree() warn: inconsistent returns 'pro=
c_subdir_lock'.

# https://github.com/0day-ci/linux/commit/3cd4ad42ca7c52d1513e7ba9f08a06197=
a7380c8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 3cd4ad42ca7c52d1513e7ba9f08a06197a7380c8
vim +/proc_subdir_lock +752 fs/proc/generic.c

8ce584c7416d8a Al Viro         2013-03-30  699  =

8ce584c7416d8a Al Viro         2013-03-30  700  int remove_proc_subtree(con=
st char *name, struct proc_dir_entry *parent)
8ce584c7416d8a Al Viro         2013-03-30  701  {
8ce584c7416d8a Al Viro         2013-03-30  702  	struct proc_dir_entry *roo=
t =3D NULL, *de, *next;
8ce584c7416d8a Al Viro         2013-03-30  703  	const char *fn =3D name;
8ce584c7416d8a Al Viro         2013-03-30  704  	unsigned int len;
8ce584c7416d8a Al Viro         2013-03-30  705  =

ecf1a3dfff22bd Waiman Long     2015-09-09  706  	write_lock(&proc_subdir_lo=
ck);
8ce584c7416d8a Al Viro         2013-03-30  707  	if (__xlate_proc_name(name=
, &parent, &fn) !=3D 0) {
ecf1a3dfff22bd Waiman Long     2015-09-09  708  		write_unlock(&proc_subdir=
_lock);
8ce584c7416d8a Al Viro         2013-03-30  709  		return -ENOENT;
8ce584c7416d8a Al Viro         2013-03-30  710  	}
8ce584c7416d8a Al Viro         2013-03-30  711  	len =3D strlen(fn);
8ce584c7416d8a Al Viro         2013-03-30  712  =

710585d4922fd3 Nicolas Dichtel 2014-12-10  713  	root =3D pde_subdir_find(p=
arent, fn, len);
8ce584c7416d8a Al Viro         2013-03-30  714  	if (!root) {
ecf1a3dfff22bd Waiman Long     2015-09-09  715  		write_unlock(&proc_subdir=
_lock);
8ce584c7416d8a Al Viro         2013-03-30  716  		return -ENOENT;
8ce584c7416d8a Al Viro         2013-03-30  717  	}
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  718  	if (unlikely(pde_is_perman=
ent(root))) {
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  719  		WARN(1, "removing permane=
nt /proc entry '%s/%s'",
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  720  			root->parent->name, root=
->name);

unlock?

3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  721  		return -EINVAL;
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  722  	}
4f1134370a29a5 Alexey Dobriyan 2018-04-10  723  	rb_erase(&root->subdir_nod=
e, &parent->subdir);
710585d4922fd3 Nicolas Dichtel 2014-12-10  724  =

8ce584c7416d8a Al Viro         2013-03-30  725  	de =3D root;
8ce584c7416d8a Al Viro         2013-03-30  726  	while (1) {
710585d4922fd3 Nicolas Dichtel 2014-12-10  727  		next =3D pde_subdir_first=
(de);
8ce584c7416d8a Al Viro         2013-03-30  728  		if (next) {
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  729  			if (unlikely(pde_is_perm=
anent(root))) {
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  730  				WARN(1, "removing perma=
nent /proc entry '%s/%s'",
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  731  					next->parent->name, ne=
xt->name);
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  732  				return -EINVAL;
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  733  			}
4f1134370a29a5 Alexey Dobriyan 2018-04-10  734  			rb_erase(&next->subdir_n=
ode, &de->subdir);
8ce584c7416d8a Al Viro         2013-03-30  735  			de =3D next;
8ce584c7416d8a Al Viro         2013-03-30  736  			continue;
8ce584c7416d8a Al Viro         2013-03-30  737  		}
8ce584c7416d8a Al Viro         2013-03-30  738  		next =3D de->parent;
8ce584c7416d8a Al Viro         2013-03-30  739  		if (S_ISDIR(de->mode))
8ce584c7416d8a Al Viro         2013-03-30  740  			next->nlink--;
e06689bf57017a Alexey Dobriyan 2019-12-04  741  		write_unlock(&proc_subdir=
_lock);
e06689bf57017a Alexey Dobriyan 2019-12-04  742  =

e06689bf57017a Alexey Dobriyan 2019-12-04  743  		proc_entry_rundown(de);
8ce584c7416d8a Al Viro         2013-03-30  744  		if (de =3D=3D root)
8ce584c7416d8a Al Viro         2013-03-30  745  			break;
8ce584c7416d8a Al Viro         2013-03-30  746  		pde_put(de);
8ce584c7416d8a Al Viro         2013-03-30  747  =

ecf1a3dfff22bd Waiman Long     2015-09-09  748  		write_lock(&proc_subdir_l=
ock);
8ce584c7416d8a Al Viro         2013-03-30  749  		de =3D next;
8ce584c7416d8a Al Viro         2013-03-30  750  	}
8ce584c7416d8a Al Viro         2013-03-30  751  	pde_put(root);
8ce584c7416d8a Al Viro         2013-03-30 @752  	return 0;
8ce584c7416d8a Al Viro         2013-03-30  753  }
8ce584c7416d8a Al Viro         2013-03-30  754  EXPORT_SYMBOL(remove_proc_s=
ubtree);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6280031471332339280==--

