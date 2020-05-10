Content-Type: multipart/mixed; boundary="===============0912631725273729579=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [bpf-next:master 801/821] kernel/bpf/bpf_iter.c:148:15-20: ERROR: invalid reference to the index variable of the iterator on line 133
Date: Sun, 10 May 2020 12:01:28 +0800
Message-ID: <202005101225.wGdrxsZo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0912631725273729579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Yonghong Song <yhs@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
head:   b4563facdcae55c83039d5efcc3b45a63da14d2f
commit: de4e05cac46d206f9090051ef09930514bff73e4 [801/821] bpf: Support bpf=
 tracing/iter programs for BPF_LINK_CREATE
:::::: branch date: 3 hours ago
:::::: commit date: 4 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> kernel/bpf/bpf_iter.c:148:15-20: ERROR: invalid reference to the index v=
ariable of the iterator on line 133

# https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?=
id=3Dde4e05cac46d206f9090051ef09930514bff73e4
git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf=
/bpf-next.git
git remote update bpf-next
git checkout de4e05cac46d206f9090051ef09930514bff73e4
vim +148 kernel/bpf/bpf_iter.c

de4e05cac46d20 Yonghong Song 2020-05-09  118  =

de4e05cac46d20 Yonghong Song 2020-05-09  119  int bpf_iter_link_attach(cons=
t union bpf_attr *attr, struct bpf_prog *prog)
de4e05cac46d20 Yonghong Song 2020-05-09  120  {
de4e05cac46d20 Yonghong Song 2020-05-09  121  	struct bpf_link_primer link_=
primer;
de4e05cac46d20 Yonghong Song 2020-05-09  122  	struct bpf_iter_target_info =
*tinfo;
de4e05cac46d20 Yonghong Song 2020-05-09  123  	struct bpf_iter_link *link;
de4e05cac46d20 Yonghong Song 2020-05-09  124  	bool existed =3D false;
de4e05cac46d20 Yonghong Song 2020-05-09  125  	u32 prog_btf_id;
de4e05cac46d20 Yonghong Song 2020-05-09  126  	int err;
de4e05cac46d20 Yonghong Song 2020-05-09  127  =

de4e05cac46d20 Yonghong Song 2020-05-09  128  	if (attr->link_create.target=
_fd || attr->link_create.flags)
de4e05cac46d20 Yonghong Song 2020-05-09  129  		return -EINVAL;
de4e05cac46d20 Yonghong Song 2020-05-09  130  =

de4e05cac46d20 Yonghong Song 2020-05-09  131  	prog_btf_id =3D prog->aux->a=
ttach_btf_id;
de4e05cac46d20 Yonghong Song 2020-05-09  132  	mutex_lock(&targets_mutex);
de4e05cac46d20 Yonghong Song 2020-05-09 @133  	list_for_each_entry(tinfo, &=
targets, list) {
de4e05cac46d20 Yonghong Song 2020-05-09  134  		if (tinfo->btf_id =3D=3D pr=
og_btf_id) {
de4e05cac46d20 Yonghong Song 2020-05-09  135  			existed =3D true;
de4e05cac46d20 Yonghong Song 2020-05-09  136  			break;
de4e05cac46d20 Yonghong Song 2020-05-09  137  		}
de4e05cac46d20 Yonghong Song 2020-05-09  138  	}
de4e05cac46d20 Yonghong Song 2020-05-09  139  	mutex_unlock(&targets_mutex);
de4e05cac46d20 Yonghong Song 2020-05-09  140  	if (!existed)
de4e05cac46d20 Yonghong Song 2020-05-09  141  		return -ENOENT;
de4e05cac46d20 Yonghong Song 2020-05-09  142  =

de4e05cac46d20 Yonghong Song 2020-05-09  143  	link =3D kzalloc(sizeof(*lin=
k), GFP_USER | __GFP_NOWARN);
de4e05cac46d20 Yonghong Song 2020-05-09  144  	if (!link)
de4e05cac46d20 Yonghong Song 2020-05-09  145  		return -ENOMEM;
de4e05cac46d20 Yonghong Song 2020-05-09  146  =

de4e05cac46d20 Yonghong Song 2020-05-09  147  	bpf_link_init(&link->link, B=
PF_LINK_TYPE_ITER, &bpf_iter_link_lops, prog);
de4e05cac46d20 Yonghong Song 2020-05-09 @148  	link->tinfo =3D tinfo;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0912631725273729579==--

