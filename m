Content-Type: multipart/mixed; boundary="===============7560246258049096184=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/helpers.c:408:20: warning: Possible null pointer dereference: storage [nullPointer]
Date: Thu, 13 May 2021 22:52:41 +0800
Message-ID: <202105132238.fovPJWxO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7560246258049096184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yonghong Song <yhs@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1
commit: b910eaaaa4b89976ef02e5d6448f3f73dc671d91 bpf: Fix NULL pointer dere=
ference in bpf_get_local_storage() helper
date:   7 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 weeks ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/bpf/helpers.c:408:20: warning: Possible null pointer dereference:=
 storage [nullPointer]
     ptr =3D &READ_ONCE(storage->buf)->data[0];
                      ^
   kernel/bpf/helpers.c:395:39: note: Assignment 'storage=3DNULL', assigned=
 value is 0
    struct bpf_cgroup_storage *storage =3D NULL;
                                         ^
   kernel/bpf/helpers.c:408:20: note: Null pointer dereference
     ptr =3D &READ_ONCE(storage->buf)->data[0];
                      ^

vim +408 kernel/bpf/helpers.c

0f09abd105da6c Daniel Borkmann 2020-03-27  383  =

8bad74f9840f87 Roman Gushchin  2018-09-28  384  #ifdef CONFIG_CGROUP_BPF
b910eaaaa4b899 Yonghong Song   2021-03-22  385  DECLARE_PER_CPU(struct bpf_=
cgroup_storage_info,
b910eaaaa4b899 Yonghong Song   2021-03-22  386  		bpf_cgroup_storage_info[B=
PF_CGROUP_STORAGE_NEST_MAX]);
cd339431765383 Roman Gushchin  2018-08-02  387  =

cd339431765383 Roman Gushchin  2018-08-02  388  BPF_CALL_2(bpf_get_local_st=
orage, struct bpf_map *, map, u64, flags)
cd339431765383 Roman Gushchin  2018-08-02  389  {
8bad74f9840f87 Roman Gushchin  2018-09-28  390  	/* flags argument is not u=
sed now,
8bad74f9840f87 Roman Gushchin  2018-09-28  391  	 * but provides an ability=
 to extend the API.
8bad74f9840f87 Roman Gushchin  2018-09-28  392  	 * verifier checks that it=
s value is correct.
cd339431765383 Roman Gushchin  2018-08-02  393  	 */
8bad74f9840f87 Roman Gushchin  2018-09-28  394  	enum bpf_cgroup_storage_ty=
pe stype =3D cgroup_storage_type(map);
b910eaaaa4b899 Yonghong Song   2021-03-22  395  	struct bpf_cgroup_storage =
*storage =3D NULL;
b741f1630346de Roman Gushchin  2018-09-28  396  	void *ptr;
b910eaaaa4b899 Yonghong Song   2021-03-22  397  	int i;
8bad74f9840f87 Roman Gushchin  2018-09-28  398  =

b910eaaaa4b899 Yonghong Song   2021-03-22  399  	for (i =3D 0; i < BPF_CGRO=
UP_STORAGE_NEST_MAX; i++) {
b910eaaaa4b899 Yonghong Song   2021-03-22  400  		if (unlikely(this_cpu_rea=
d(bpf_cgroup_storage_info[i].task) !=3D current))
b910eaaaa4b899 Yonghong Song   2021-03-22  401  			continue;
b910eaaaa4b899 Yonghong Song   2021-03-22  402  =

b910eaaaa4b899 Yonghong Song   2021-03-22  403  		storage =3D this_cpu_read=
(bpf_cgroup_storage_info[i].storage[stype]);
b910eaaaa4b899 Yonghong Song   2021-03-22  404  		break;
b910eaaaa4b899 Yonghong Song   2021-03-22  405  	}
f294b37ec7b24a Roman Gushchin  2018-09-28  406  =

b741f1630346de Roman Gushchin  2018-09-28  407  	if (stype =3D=3D BPF_CGROU=
P_STORAGE_SHARED)
b741f1630346de Roman Gushchin  2018-09-28 @408  		ptr =3D &READ_ONCE(storag=
e->buf)->data[0];
b741f1630346de Roman Gushchin  2018-09-28  409  	else
b741f1630346de Roman Gushchin  2018-09-28  410  		ptr =3D this_cpu_ptr(stor=
age->percpu_buf);
b741f1630346de Roman Gushchin  2018-09-28  411  =

b741f1630346de Roman Gushchin  2018-09-28  412  	return (unsigned long)ptr;
cd339431765383 Roman Gushchin  2018-08-02  413  }
cd339431765383 Roman Gushchin  2018-08-02  414  =


:::::: The code at line 408 was first introduced by commit
:::::: b741f1630346defcbc8cc60f1a2bdae8b3b0036f bpf: introduce per-cpu cgro=
up local storage

:::::: TO: Roman Gushchin <guro@fb.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7560246258049096184==--

