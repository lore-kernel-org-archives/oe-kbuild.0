Content-Type: multipart/mixed; boundary="===============5243638599778779272=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2296/2770] kernel/bpf/helpers.c:713:43: warning: Uninitialized variable: bufs [uninitvar]
Date: Fri, 14 May 2021 00:10:08 +0800
Message-ID: <202105140006.1O9TwMPz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5243638599778779272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Florent Revest <revest@chromium.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ec2618180c3450d06a6a4ba951d4c9a2c689b517
commit: e2d5b2bb769fa5f500760caba76436ba3a10a895 [2296/2770] bpf: Fix neste=
d bpf_bprintf_prepare with more per-cpu buffers
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/bpf/helpers.c:713:43: warning: Uninitialized variable: bufs [unin=
itvar]
    if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(bufs->tmp_bufs))) {
                                             ^
   kernel/bpf/helpers.c:408:20: warning: Possible null pointer dereference:=
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

vim +713 kernel/bpf/helpers.c

d9c9e4db186ab4 Florent Revest 2021-04-19  705  =

d9c9e4db186ab4 Florent Revest 2021-04-19  706  static int try_get_fmt_tmp_b=
uf(char **tmp_buf)
d9c9e4db186ab4 Florent Revest 2021-04-19  707  {
e2d5b2bb769fa5 Florent Revest 2021-05-11  708  	struct bpf_bprintf_buffers =
*bufs;
e2d5b2bb769fa5 Florent Revest 2021-05-11  709  	int nest_level;
d9c9e4db186ab4 Florent Revest 2021-04-19  710  =

d9c9e4db186ab4 Florent Revest 2021-04-19  711  	preempt_disable();
e2d5b2bb769fa5 Florent Revest 2021-05-11  712  	nest_level =3D this_cpu_inc=
_return(bpf_bprintf_nest_level);
e2d5b2bb769fa5 Florent Revest 2021-05-11 @713  	if (WARN_ON_ONCE(nest_level=
 > ARRAY_SIZE(bufs->tmp_bufs))) {
e2d5b2bb769fa5 Florent Revest 2021-05-11  714  		this_cpu_dec(bpf_bprintf_n=
est_level);
d9c9e4db186ab4 Florent Revest 2021-04-19  715  		preempt_enable();
d9c9e4db186ab4 Florent Revest 2021-04-19  716  		return -EBUSY;
d9c9e4db186ab4 Florent Revest 2021-04-19  717  	}
e2d5b2bb769fa5 Florent Revest 2021-05-11  718  	bufs =3D this_cpu_ptr(&bpf_=
bprintf_bufs);
e2d5b2bb769fa5 Florent Revest 2021-05-11  719  	*tmp_buf =3D bufs->tmp_bufs=
[nest_level - 1];
d9c9e4db186ab4 Florent Revest 2021-04-19  720  =

d9c9e4db186ab4 Florent Revest 2021-04-19  721  	return 0;
d9c9e4db186ab4 Florent Revest 2021-04-19  722  }
d9c9e4db186ab4 Florent Revest 2021-04-19  723  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5243638599778779272==--

