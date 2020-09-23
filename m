Content-Type: multipart/mixed; boundary="===============5252479921890613006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/stackmap.c:697:6: warning: Variable 'err' is reassigned a value before the old one has been used.
Date: Wed, 23 Sep 2020 20:53:58 +0800
Message-ID: <202009232053.bbDbW1Is%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5252479921890613006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Song Liu <songliubraving@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   805c6d3c19210c90c109107d189744e960eae025
commit: 7b04d6d60fcfb5b2200ffebb9cfb90927bdfeec7 bpf: Separate bpf_get_[sta=
ck|stackid] for perf events BPF
date:   8 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 weeks ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/bpf/stackmap.c:697:6: warning: Variable 'err' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
    err =3D -EFAULT;
        ^
   kernel/bpf/stackmap.c:684:0: note: Variable 'err' is reassigned a value =
before the old one has been used.
    int err =3D -EINVAL;
   ^
   kernel/bpf/stackmap.c:697:6: note: Variable 'err' is reassigned a value =
before the old one has been used.
    err =3D -EFAULT;
        ^
   kernel/bpf/stackmap.c:708:7: warning: Variable 'err' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
     err =3D __bpf_get_stack(ctx->regs, NULL, trace, buf,
         ^
   kernel/bpf/stackmap.c:697:6: note: Variable 'err' is reassigned a value =
before the old one has been used.
    err =3D -EFAULT;
        ^
   kernel/bpf/stackmap.c:708:7: note: Variable 'err' is reassigned a value =
before the old one has been used.
     err =3D __bpf_get_stack(ctx->regs, NULL, trace, buf,
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D7b04d6d60fcfb5b2200ffebb9cfb90927bdfeec7
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 7b04d6d60fcfb5b2200ffebb9cfb90927bdfeec7
vim +/err +697 kernel/bpf/stackmap.c

fa28dcb82a38f8e Song Liu 2020-06-29  677  =

7b04d6d60fcfb5b Song Liu 2020-07-23  678  BPF_CALL_4(bpf_get_stack_pe, stru=
ct bpf_perf_event_data_kern *, ctx,
7b04d6d60fcfb5b Song Liu 2020-07-23  679  	   void *, buf, u32, size, u64, =
flags)
7b04d6d60fcfb5b Song Liu 2020-07-23  680  {
7b04d6d60fcfb5b Song Liu 2020-07-23  681  	struct perf_event *event =3D ctx=
->event;
7b04d6d60fcfb5b Song Liu 2020-07-23  682  	struct perf_callchain_entry *tra=
ce;
7b04d6d60fcfb5b Song Liu 2020-07-23  683  	bool kernel, user;
7b04d6d60fcfb5b Song Liu 2020-07-23  684  	int err =3D -EINVAL;
7b04d6d60fcfb5b Song Liu 2020-07-23  685  	__u64 nr_kernel;
7b04d6d60fcfb5b Song Liu 2020-07-23  686  =

7b04d6d60fcfb5b Song Liu 2020-07-23  687  	if (!(event->attr.sample_type & =
__PERF_SAMPLE_CALLCHAIN_EARLY))
7b04d6d60fcfb5b Song Liu 2020-07-23  688  		return __bpf_get_stack(ctx->reg=
s, NULL, NULL, buf, size, flags);
7b04d6d60fcfb5b Song Liu 2020-07-23  689  =

7b04d6d60fcfb5b Song Liu 2020-07-23  690  	if (unlikely(flags & ~(BPF_F_SKI=
P_FIELD_MASK | BPF_F_USER_STACK |
7b04d6d60fcfb5b Song Liu 2020-07-23  691  			       BPF_F_USER_BUILD_ID)))
7b04d6d60fcfb5b Song Liu 2020-07-23  692  		goto clear;
7b04d6d60fcfb5b Song Liu 2020-07-23  693  =

7b04d6d60fcfb5b Song Liu 2020-07-23  694  	user =3D flags & BPF_F_USER_STAC=
K;
7b04d6d60fcfb5b Song Liu 2020-07-23  695  	kernel =3D !user;
7b04d6d60fcfb5b Song Liu 2020-07-23  696  =

7b04d6d60fcfb5b Song Liu 2020-07-23 @697  	err =3D -EFAULT;
7b04d6d60fcfb5b Song Liu 2020-07-23  698  	trace =3D ctx->data->callchain;
7b04d6d60fcfb5b Song Liu 2020-07-23  699  	if (unlikely(!trace))
7b04d6d60fcfb5b Song Liu 2020-07-23  700  		goto clear;
7b04d6d60fcfb5b Song Liu 2020-07-23  701  =

7b04d6d60fcfb5b Song Liu 2020-07-23  702  	nr_kernel =3D count_kernel_ip(tr=
ace);
7b04d6d60fcfb5b Song Liu 2020-07-23  703  =

7b04d6d60fcfb5b Song Liu 2020-07-23  704  	if (kernel) {
7b04d6d60fcfb5b Song Liu 2020-07-23  705  		__u64 nr =3D trace->nr;
7b04d6d60fcfb5b Song Liu 2020-07-23  706  =

7b04d6d60fcfb5b Song Liu 2020-07-23  707  		trace->nr =3D nr_kernel;
7b04d6d60fcfb5b Song Liu 2020-07-23  708  		err =3D __bpf_get_stack(ctx->re=
gs, NULL, trace, buf,
7b04d6d60fcfb5b Song Liu 2020-07-23  709  				      size, flags);
7b04d6d60fcfb5b Song Liu 2020-07-23  710  =

7b04d6d60fcfb5b Song Liu 2020-07-23  711  		/* restore nr */
7b04d6d60fcfb5b Song Liu 2020-07-23  712  		trace->nr =3D nr;
7b04d6d60fcfb5b Song Liu 2020-07-23  713  	} else { /* user */
7b04d6d60fcfb5b Song Liu 2020-07-23  714  		u64 skip =3D flags & BPF_F_SKIP=
_FIELD_MASK;
7b04d6d60fcfb5b Song Liu 2020-07-23  715  =

7b04d6d60fcfb5b Song Liu 2020-07-23  716  		skip +=3D nr_kernel;
7b04d6d60fcfb5b Song Liu 2020-07-23  717  		if (skip > BPF_F_SKIP_FIELD_MAS=
K)
7b04d6d60fcfb5b Song Liu 2020-07-23  718  			goto clear;
7b04d6d60fcfb5b Song Liu 2020-07-23  719  =

7b04d6d60fcfb5b Song Liu 2020-07-23  720  		flags =3D (flags & ~BPF_F_SKIP_=
FIELD_MASK) | skip;
7b04d6d60fcfb5b Song Liu 2020-07-23  721  		err =3D __bpf_get_stack(ctx->re=
gs, NULL, trace, buf,
7b04d6d60fcfb5b Song Liu 2020-07-23  722  				      size, flags);
7b04d6d60fcfb5b Song Liu 2020-07-23  723  	}
7b04d6d60fcfb5b Song Liu 2020-07-23  724  	return err;
7b04d6d60fcfb5b Song Liu 2020-07-23  725  =

7b04d6d60fcfb5b Song Liu 2020-07-23  726  clear:
7b04d6d60fcfb5b Song Liu 2020-07-23  727  	memset(buf, 0, size);
7b04d6d60fcfb5b Song Liu 2020-07-23  728  	return err;
7b04d6d60fcfb5b Song Liu 2020-07-23  729  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5252479921890613006==--

