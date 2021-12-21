Content-Type: multipart/mixed; boundary="===============8062458260377368907=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/x86.c:7712:61: warning: Possible null pointer dereference: data [nullPointer]
Date: Wed, 22 Dec 2021 00:25:54 +0800
Message-ID: <202112212327.Ppslkgaz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8062458260377368907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Edmondson <david.edmondson@oracle.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6e0567b7305209c2d689ce57180a63d8dc657ad8
commit: e615e355894e619785af81479ad6f5a05a8a2e3f KVM: x86: On emulation fai=
lure, convey the exit reason, etc. to userspace
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kvm/x86.c:7712:61: warning: Possible null pointer dereference: =
data [nullPointer]
    memcpy(&run->internal.data[info_start + ARRAY_SIZE(info)], data,
                                                               ^
   arch/x86/kvm/x86.c:7722:39: note: Calling function 'prepare_emulation_fa=
ilure_exit', 2nd argument 'NULL' value is 0
    prepare_emulation_failure_exit(vcpu, NULL, 0, ctxt->fetch.data,
                                         ^
   arch/x86/kvm/x86.c:7712:61: note: Null pointer dereference
    memcpy(&run->internal.data[info_start + ARRAY_SIZE(info)], data,
                                                               ^
   arch/x86/kvm/x86.c:4794:29: warning: Opposite expression on both sides o=
f '&'. [oppositeExpression]
     u64 xfeature_mask =3D valid & -valid;
                               ^
   arch/x86/kvm/x86.c:4838:29: warning: Opposite expression on both sides o=
f '&'. [oppositeExpression]
     u64 xfeature_mask =3D valid & -valid;
                               ^
>> arch/x86/kvm/x86.c:534:11: warning: Shifting signed 32-bit value by 31 b=
its is undefined behaviour. See condition at line 531. [shiftTooManyBitsSig=
ned]
    mask =3D 1 << vector;
             ^
   arch/x86/kvm/x86.c:531:21: note: Assuming that condition 'vector>31' is =
not redundant
    if (WARN_ON(vector > 31 || vector =3D=3D NMI_VECTOR))
                       ^
   arch/x86/kvm/x86.c:534:11: note: Shift
    mask =3D 1 << vector;
             ^
   arch/x86/kvm/x86.c:6733:6: warning: Buffer is accessed out of bounds: kv=
m_emulate_prefix [bufferAccessOutOfBounds]
        memcmp(sig, kvm_emulate_prefix, sizeof(sig)) =3D=3D 0) {
        ^

vim +7712 arch/x86/kvm/x86.c

63995653ade16d Mohammed Gamal  2010-09-19  7666  =

e615e355894e61 David Edmondson 2021-09-20  7667  static void prepare_emulat=
ion_failure_exit(struct kvm_vcpu *vcpu, u64 *data,
e615e355894e61 David Edmondson 2021-09-20  7668  					   u8 ndata, u8 *insn=
_bytes, u8 insn_size)
19238e75bd8ed8 Aaron Lewis     2021-05-10  7669  {
19238e75bd8ed8 Aaron Lewis     2021-05-10  7670  	struct kvm_run *run =3D v=
cpu->run;
e615e355894e61 David Edmondson 2021-09-20  7671  	u64 info[5];
e615e355894e61 David Edmondson 2021-09-20  7672  	u8 info_start;
e615e355894e61 David Edmondson 2021-09-20  7673  =

e615e355894e61 David Edmondson 2021-09-20  7674  	/*
e615e355894e61 David Edmondson 2021-09-20  7675  	 * Zero the whole array u=
sed to retrieve the exit info, as casting to
e615e355894e61 David Edmondson 2021-09-20  7676  	 * u32 for select entries=
 will leave some chunks uninitialized.
e615e355894e61 David Edmondson 2021-09-20  7677  	 */
e615e355894e61 David Edmondson 2021-09-20  7678  	memset(&info, 0, sizeof(i=
nfo));
e615e355894e61 David Edmondson 2021-09-20  7679  =

e615e355894e61 David Edmondson 2021-09-20  7680  	static_call(kvm_x86_get_e=
xit_info)(vcpu, (u32 *)&info[0], &info[1],
e615e355894e61 David Edmondson 2021-09-20  7681  					   &info[2], (u32 *)&=
info[3],
e615e355894e61 David Edmondson 2021-09-20  7682  					   (u32 *)&info[4]);
19238e75bd8ed8 Aaron Lewis     2021-05-10  7683  =

19238e75bd8ed8 Aaron Lewis     2021-05-10  7684  	run->exit_reason =3D KVM_=
EXIT_INTERNAL_ERROR;
19238e75bd8ed8 Aaron Lewis     2021-05-10  7685  	run->emulation_failure.su=
berror =3D KVM_INTERNAL_ERROR_EMULATION;
e615e355894e61 David Edmondson 2021-09-20  7686  =

e615e355894e61 David Edmondson 2021-09-20  7687  	/*
e615e355894e61 David Edmondson 2021-09-20  7688  	 * There's currently spac=
e for 13 entries, but 5 are used for the exit
e615e355894e61 David Edmondson 2021-09-20  7689  	 * reason and info.  Rest=
rict to 4 to reduce the maintenance burden
e615e355894e61 David Edmondson 2021-09-20  7690  	 * when expanding kvm_run=
.emulation_failure in the future.
e615e355894e61 David Edmondson 2021-09-20  7691  	 */
e615e355894e61 David Edmondson 2021-09-20  7692  	if (WARN_ON_ONCE(ndata > =
4))
e615e355894e61 David Edmondson 2021-09-20  7693  		ndata =3D 4;
e615e355894e61 David Edmondson 2021-09-20  7694  =

e615e355894e61 David Edmondson 2021-09-20  7695  	/* Always include the fla=
gs as a 'data' entry. */
e615e355894e61 David Edmondson 2021-09-20  7696  	info_start =3D 1;
19238e75bd8ed8 Aaron Lewis     2021-05-10  7697  	run->emulation_failure.fl=
ags =3D 0;
19238e75bd8ed8 Aaron Lewis     2021-05-10  7698  =

19238e75bd8ed8 Aaron Lewis     2021-05-10  7699  	if (insn_size) {
e615e355894e61 David Edmondson 2021-09-20  7700  		BUILD_BUG_ON((sizeof(run=
->emulation_failure.insn_size) +
e615e355894e61 David Edmondson 2021-09-20  7701  			      sizeof(run->emula=
tion_failure.insn_bytes) !=3D 16));
e615e355894e61 David Edmondson 2021-09-20  7702  		info_start +=3D 2;
19238e75bd8ed8 Aaron Lewis     2021-05-10  7703  		run->emulation_failure.f=
lags |=3D
19238e75bd8ed8 Aaron Lewis     2021-05-10  7704  			KVM_INTERNAL_ERROR_EMUL=
ATION_FLAG_INSTRUCTION_BYTES;
19238e75bd8ed8 Aaron Lewis     2021-05-10  7705  		run->emulation_failure.i=
nsn_size =3D insn_size;
19238e75bd8ed8 Aaron Lewis     2021-05-10  7706  		memset(run->emulation_fa=
ilure.insn_bytes, 0x90,
19238e75bd8ed8 Aaron Lewis     2021-05-10  7707  		       sizeof(run->emula=
tion_failure.insn_bytes));
e615e355894e61 David Edmondson 2021-09-20  7708  		memcpy(run->emulation_fa=
ilure.insn_bytes, insn_bytes, insn_size);
e615e355894e61 David Edmondson 2021-09-20  7709  	}
e615e355894e61 David Edmondson 2021-09-20  7710  =

e615e355894e61 David Edmondson 2021-09-20  7711  	memcpy(&run->internal.dat=
a[info_start], info, sizeof(info));
e615e355894e61 David Edmondson 2021-09-20 @7712  	memcpy(&run->internal.dat=
a[info_start + ARRAY_SIZE(info)], data,
e615e355894e61 David Edmondson 2021-09-20  7713  	       ndata * sizeof(dat=
a[0]));
e615e355894e61 David Edmondson 2021-09-20  7714  =

e615e355894e61 David Edmondson 2021-09-20  7715  	run->emulation_failure.nd=
ata =3D info_start + ARRAY_SIZE(info) + ndata;
e615e355894e61 David Edmondson 2021-09-20  7716  }
e615e355894e61 David Edmondson 2021-09-20  7717  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8062458260377368907==--

