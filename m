Content-Type: multipart/mixed; boundary="===============4117636026184446667=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 04/11] KVM: VMX: Define VMCS-to-EVMCS conversion for the new fields
Date: Wed, 22 Jun 2022 21:21:30 +0800
Message-ID: <202206222136.EXbzHGUw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4117636026184446667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220621155830.60115-5-vkuznets@redhat.com>
References: <20220621155830.60115-5-vkuznets@redhat.com>
TO: Vitaly Kuznetsov <vkuznets@redhat.com>
TO: kvm(a)vger.kernel.org
TO: Paolo Bonzini <pbonzini@redhat.com>
CC: Anirudh Rayabharam <anrayabh@linux.microsoft.com>
CC: Sean Christopherson <seanjc@google.com>
CC: Wanpeng Li <wanpengli@tencent.com>
CC: Jim Mattson <jmattson@google.com>
CC: Maxim Levitsky <mlevitsk@redhat.com>
CC: linux-hyperv(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Vitaly,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kvm/queue]
[also build test WARNING on tip/x86/core mst-vhost/linux-next linus/master =
next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Kuznetsov/KVM=
-VMX-Support-TscScaling-and-EnclsExitingBitmap-whith-eVMCS/20220622-000357
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220622/202206222136.EXbzHGUw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-31-g4880bd19-dirty
        # https://github.com/intel-lab-lkp/linux/commit/933b7b547c0b7e486ca=
f69d1f25626b90ea0f3a1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vitaly-Kuznetsov/KVM-VMX-Support-T=
scScaling-and-EnclsExitingBitmap-whith-eVMCS/20220622-000357
        git checkout 933b7b547c0b7e486caf69d1f25626b90ea0f3a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/evmcs.c:21:9: sparse: sparse: cast truncates bits from =
constant value (1a079a becomes 79a)
   arch/x86/kvm/vmx/evmcs.c:23:9: sparse: sparse: cast truncates bits from =
constant value (1a071a becomes 71a)
   arch/x86/kvm/vmx/evmcs.c:25:9: sparse: sparse: cast truncates bits from =
constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/evmcs.c:27:9: sparse: sparse: cast truncates bits from =
constant value (b000b becomes b)
   arch/x86/kvm/vmx/evmcs.c:29:9: sparse: sparse: cast truncates bits from =
constant value (b008b becomes 8b)
>> arch/x86/kvm/vmx/evmcs.c:31:9: sparse: sparse: cast truncates bits from =
constant value (b010b becomes 10b)
   arch/x86/kvm/vmx/evmcs.c:33:9: sparse: sparse: cast truncates bits from =
constant value (1b001b becomes 1b)
   arch/x86/kvm/vmx/evmcs.c:35:9: sparse: sparse: cast truncates bits from =
constant value (1b009b becomes 9b)
   arch/x86/kvm/vmx/evmcs.c:37:9: sparse: sparse: cast truncates bits from =
constant value (1b011b becomes 11b)
   arch/x86/kvm/vmx/evmcs.c:39:9: sparse: sparse: cast truncates bits from =
constant value (1b041b becomes 41b)
   arch/x86/kvm/vmx/evmcs.c:41:9: sparse: sparse: cast truncates bits from =
constant value (1b049b becomes 49b)
   arch/x86/kvm/vmx/evmcs.c:43:9: sparse: sparse: cast truncates bits from =
constant value (1b059b becomes 59b)
   arch/x86/kvm/vmx/evmcs.c:45:9: sparse: sparse: cast truncates bits from =
constant value (80008 becomes 8)
   arch/x86/kvm/vmx/evmcs.c:47:9: sparse: sparse: cast truncates bits from =
constant value (80088 becomes 88)
   arch/x86/kvm/vmx/evmcs.c:49:9: sparse: sparse: cast truncates bits from =
constant value (80108 becomes 108)
   arch/x86/kvm/vmx/evmcs.c:51:9: sparse: sparse: cast truncates bits from =
constant value (1a019a becomes 19a)
   arch/x86/kvm/vmx/evmcs.c:53:9: sparse: sparse: cast truncates bits from =
constant value (1a021a becomes 21a)
   arch/x86/kvm/vmx/evmcs.c:55:9: sparse: sparse: cast truncates bits from =
constant value (1a029a becomes 29a)
   arch/x86/kvm/vmx/evmcs.c:57:9: sparse: sparse: cast truncates bits from =
constant value (1a031a becomes 31a)
   arch/x86/kvm/vmx/evmcs.c:59:9: sparse: sparse: cast truncates bits from =
constant value (1a039a becomes 39a)
   arch/x86/kvm/vmx/evmcs.c:61:9: sparse: sparse: cast truncates bits from =
constant value (1a041a becomes 41a)
   arch/x86/kvm/vmx/evmcs.c:63:9: sparse: sparse: cast truncates bits from =
constant value (1a049a becomes 49a)
   arch/x86/kvm/vmx/evmcs.c:65:9: sparse: sparse: cast truncates bits from =
constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/evmcs.c:67:9: sparse: sparse: cast truncates bits from =
constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/evmcs.c:69:9: sparse: sparse: cast truncates bits from =
constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/evmcs.c:71:9: sparse: sparse: cast truncates bits from =
constant value (80408 becomes 408)
   arch/x86/kvm/vmx/evmcs.c:73:9: sparse: sparse: cast truncates bits from =
constant value (80488 becomes 488)
   arch/x86/kvm/vmx/evmcs.c:75:9: sparse: sparse: cast truncates bits from =
constant value (a000a becomes a)
   arch/x86/kvm/vmx/evmcs.c:77:9: sparse: sparse: cast truncates bits from =
constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/evmcs.c:79:9: sparse: sparse: cast truncates bits from =
constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/evmcs.c:81:9: sparse: sparse: cast truncates bits from =
constant value (a018a becomes 18a)
>> arch/x86/kvm/vmx/evmcs.c:83:9: sparse: sparse: cast truncates bits from =
constant value (a020a becomes 20a)
   arch/x86/kvm/vmx/evmcs.c:85:9: sparse: sparse: cast truncates bits from =
constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/evmcs.c:87:9: sparse: sparse: cast truncates bits from =
constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/evmcs.c:89:9: sparse: sparse: cast truncates bits from =
constant value (a038a becomes 38a)
   arch/x86/kvm/vmx/evmcs.c:91:9: sparse: sparse: cast truncates bits from =
constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/evmcs.c:93:9: sparse: sparse: cast truncates bits from =
constant value (1a089a becomes 89a)
   arch/x86/kvm/vmx/evmcs.c:95:9: sparse: sparse: cast truncates bits from =
constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/evmcs.c:97:9: sparse: sparse: cast truncates bits from =
constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/evmcs.c:99:9: sparse: sparse: cast truncates bits from =
constant value (180018 becomes 18)
   arch/x86/kvm/vmx/evmcs.c:101:9: sparse: sparse: cast truncates bits from=
 constant value (180098 becomes 98)
   arch/x86/kvm/vmx/evmcs.c:103:9: sparse: sparse: cast truncates bits from=
 constant value (180118 becomes 118)
   arch/x86/kvm/vmx/evmcs.c:105:9: sparse: sparse: cast truncates bits from=
 constant value (180198 becomes 198)
   arch/x86/kvm/vmx/evmcs.c:107:9: sparse: sparse: cast truncates bits from=
 constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/evmcs.c:109:9: sparse: sparse: cast truncates bits from=
 constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/evmcs.c:111:9: sparse: sparse: cast truncates bits from=
 constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/evmcs.c:113:9: sparse: sparse: cast truncates bits from=
 constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/evmcs.c:115:9: sparse: sparse: cast truncates bits from=
 constant value (1b019b becomes 19b)
   arch/x86/kvm/vmx/evmcs.c:117:9: sparse: sparse: cast truncates bits from=
 constant value (1b021b becomes 21b)
   arch/x86/kvm/vmx/evmcs.c:119:9: sparse: sparse: cast truncates bits from=
 constant value (1b029b becomes 29b)
   arch/x86/kvm/vmx/evmcs.c:121:9: sparse: sparse: cast truncates bits from=
 constant value (1b031b becomes 31b)
   arch/x86/kvm/vmx/evmcs.c:123:9: sparse: sparse: cast truncates bits from=
 constant value (1b039b becomes 39b)
   arch/x86/kvm/vmx/evmcs.c:125:9: sparse: sparse: cast truncates bits from=
 constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/evmcs.c:127:9: sparse: sparse: cast truncates bits from=
 constant value (80688 becomes 688)
   arch/x86/kvm/vmx/evmcs.c:129:9: sparse: sparse: cast truncates bits from=
 constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/evmcs.c:131:9: sparse: sparse: cast truncates bits from=
 constant value (80b08 becomes b08)
>> arch/x86/kvm/vmx/evmcs.c:133:9: sparse: sparse: cast truncates bits from=
 constant value (80b88 becomes b88)
>> arch/x86/kvm/vmx/evmcs.c:135:9: sparse: sparse: cast truncates bits from=
 constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/evmcs.c:157:9: sparse: sparse: cast truncates bits from=
 constant value (90009 becomes 9)
   arch/x86/kvm/vmx/evmcs.c:159:9: sparse: sparse: cast truncates bits from=
 constant value (190019 becomes 19)
   arch/x86/kvm/vmx/evmcs.c:173:9: sparse: sparse: cast truncates bits from=
 constant value (190299 becomes 299)
   arch/x86/kvm/vmx/evmcs.c:181:9: sparse: sparse: cast truncates bits from=
 constant value (80188 becomes 188)
   arch/x86/kvm/vmx/evmcs.c:183:9: sparse: sparse: cast truncates bits from=
 constant value (80208 becomes 208)
   arch/x86/kvm/vmx/evmcs.c:185:9: sparse: sparse: cast truncates bits from=
 constant value (80288 becomes 288)
   arch/x86/kvm/vmx/evmcs.c:189:9: sparse: sparse: cast truncates bits from=
 constant value (100710 becomes 710)
   arch/x86/kvm/vmx/evmcs.c:191:9: sparse: sparse: cast truncates bits from=
 constant value (120912 becomes 912)
   arch/x86/kvm/vmx/evmcs.c:193:9: sparse: sparse: cast truncates bits from=
 constant value (100090 becomes 90)
   arch/x86/kvm/vmx/evmcs.c:195:9: sparse: sparse: cast truncates bits from=
 constant value (100110 becomes 110)
   arch/x86/kvm/vmx/evmcs.c:197:9: sparse: sparse: cast truncates bits from=
 constant value (100490 becomes 490)
   arch/x86/kvm/vmx/evmcs.c:199:9: sparse: sparse: cast truncates bits from=
 constant value (100590 becomes 590)
   arch/x86/kvm/vmx/evmcs.c:201:9: sparse: sparse: cast truncates bits from=
 constant value (100610 becomes 610)
   arch/x86/kvm/vmx/evmcs.c:204:9: sparse: sparse: cast truncates bits from=
 constant value (100690 becomes 690)
   arch/x86/kvm/vmx/evmcs.c:206:9: sparse: sparse: cast truncates bits from=
 constant value (130013 becomes 13)
   arch/x86/kvm/vmx/evmcs.c:208:9: sparse: sparse: cast truncates bits from=
 constant value (100010 becomes 10)
   arch/x86/kvm/vmx/evmcs.c:210:9: sparse: sparse: cast truncates bits from=
 constant value (100310 becomes 310)
   arch/x86/kvm/vmx/evmcs.c:212:9: sparse: sparse: cast truncates bits from=
 constant value (100790 becomes 790)
   arch/x86/kvm/vmx/evmcs.c:214:9: sparse: sparse: cast truncates bits from=
 constant value (120012 becomes 12)
   arch/x86/kvm/vmx/evmcs.c:216:9: sparse: sparse: cast truncates bits from=
 constant value (120092 becomes 92)
   arch/x86/kvm/vmx/evmcs.c:218:9: sparse: sparse: cast truncates bits from=
 constant value (120112 becomes 112)
   arch/x86/kvm/vmx/evmcs.c:220:9: sparse: sparse: cast truncates bits from=
 constant value (120192 becomes 192)
   arch/x86/kvm/vmx/evmcs.c:222:9: sparse: sparse: cast truncates bits from=
 constant value (120212 becomes 212)
   arch/x86/kvm/vmx/evmcs.c:224:9: sparse: sparse: cast truncates bits from=
 constant value (120292 becomes 292)
   arch/x86/kvm/vmx/evmcs.c:226:9: sparse: sparse: cast truncates bits from=
 constant value (120312 becomes 312)
   arch/x86/kvm/vmx/evmcs.c:228:9: sparse: sparse: cast truncates bits from=
 constant value (120392 becomes 392)
   arch/x86/kvm/vmx/evmcs.c:230:9: sparse: sparse: cast truncates bits from=
 constant value (120412 becomes 412)
   arch/x86/kvm/vmx/evmcs.c:232:9: sparse: sparse: cast truncates bits from=
 constant value (120492 becomes 492)
   arch/x86/kvm/vmx/evmcs.c:234:9: sparse: sparse: cast truncates bits from=
 constant value (120512 becomes 512)
   arch/x86/kvm/vmx/evmcs.c:236:9: sparse: sparse: cast truncates bits from=
 constant value (120592 becomes 592)
   arch/x86/kvm/vmx/evmcs.c:238:9: sparse: sparse: cast truncates bits from=
 constant value (120612 becomes 612)
   arch/x86/kvm/vmx/evmcs.c:240:9: sparse: sparse: cast truncates bits from=
 constant value (120692 becomes 692)
   arch/x86/kvm/vmx/evmcs.c:242:9: sparse: sparse: cast truncates bits from=
 constant value (120712 becomes 712)
   arch/x86/kvm/vmx/evmcs.c:244:9: sparse: sparse: cast truncates bits from=
 constant value (120792 becomes 792)
   arch/x86/kvm/vmx/evmcs.c:246:9: sparse: sparse: cast truncates bits from=
 constant value (120812 becomes 812)
   arch/x86/kvm/vmx/evmcs.c:248:9: sparse: sparse: cast truncates bits from=
 constant value (120892 becomes 892)
   arch/x86/kvm/vmx/evmcs.c:250:9: sparse: sparse: cast truncates bits from=
 constant value (120992 becomes 992)
   arch/x86/kvm/vmx/evmcs.c:252:9: sparse: sparse: cast truncates bits from=
 constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/evmcs.c:256:9: sparse: sparse: cast truncates bits from=
 constant value (110011 becomes 11)
   arch/x86/kvm/vmx/evmcs.c:258:9: sparse: sparse: cast truncates bits from=
 constant value (110091 becomes 91)
   arch/x86/kvm/vmx/evmcs.c:260:9: sparse: sparse: cast truncates bits from=
 constant value (110111 becomes 111)
   arch/x86/kvm/vmx/evmcs.c:262:9: sparse: sparse: too many warnings

vim +31 arch/x86/kvm/vmx/evmcs.c

75edce8a45486fe Sean Christopherson 2018-12-03   14  =

75edce8a45486fe Sean Christopherson 2018-12-03   15  #define EVMCS1_OFFSET(=
x) offsetof(struct hv_enlightened_vmcs, x)
75edce8a45486fe Sean Christopherson 2018-12-03   16  #define EVMCS1_FIELD(n=
umber, name, clean_field)[ROL16(number, 6)] =3D \
75edce8a45486fe Sean Christopherson 2018-12-03   17  		{EVMCS1_OFFSET(name)=
, clean_field}
75edce8a45486fe Sean Christopherson 2018-12-03   18  =

75edce8a45486fe Sean Christopherson 2018-12-03   19  const struct evmcs_fie=
ld vmcs_field_to_evmcs_1[] =3D {
75edce8a45486fe Sean Christopherson 2018-12-03   20  	/* 64 bit rw */
75edce8a45486fe Sean Christopherson 2018-12-03   21  	EVMCS1_FIELD(GUEST_RI=
P, guest_rip,
75edce8a45486fe Sean Christopherson 2018-12-03   22  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03   23  	EVMCS1_FIELD(GUEST_RS=
P, guest_rsp,
75edce8a45486fe Sean Christopherson 2018-12-03   24  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486fe Sean Christopherson 2018-12-03   25  	EVMCS1_FIELD(GUEST_RF=
LAGS, guest_rflags,
75edce8a45486fe Sean Christopherson 2018-12-03   26  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486fe Sean Christopherson 2018-12-03   27  	EVMCS1_FIELD(HOST_IA3=
2_PAT, host_ia32_pat,
75edce8a45486fe Sean Christopherson 2018-12-03   28  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   29  	EVMCS1_FIELD(HOST_IA3=
2_EFER, host_ia32_efer,
75edce8a45486fe Sean Christopherson 2018-12-03   30  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  @31  	EVMCS1_FIELD(HOST_IA3=
2_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21   32  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   33  	EVMCS1_FIELD(HOST_CR0=
, host_cr0,
75edce8a45486fe Sean Christopherson 2018-12-03   34  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   35  	EVMCS1_FIELD(HOST_CR3=
, host_cr3,
75edce8a45486fe Sean Christopherson 2018-12-03   36  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   37  	EVMCS1_FIELD(HOST_CR4=
, host_cr4,
75edce8a45486fe Sean Christopherson 2018-12-03   38  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   39  	EVMCS1_FIELD(HOST_IA3=
2_SYSENTER_ESP, host_ia32_sysenter_esp,
75edce8a45486fe Sean Christopherson 2018-12-03   40  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   41  	EVMCS1_FIELD(HOST_IA3=
2_SYSENTER_EIP, host_ia32_sysenter_eip,
75edce8a45486fe Sean Christopherson 2018-12-03   42  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   43  	EVMCS1_FIELD(HOST_RIP=
, host_rip,
75edce8a45486fe Sean Christopherson 2018-12-03   44  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   45  	EVMCS1_FIELD(IO_BITMA=
P_A, io_bitmap_a,
75edce8a45486fe Sean Christopherson 2018-12-03   46  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_IO_BITMAP),
75edce8a45486fe Sean Christopherson 2018-12-03   47  	EVMCS1_FIELD(IO_BITMA=
P_B, io_bitmap_b,
75edce8a45486fe Sean Christopherson 2018-12-03   48  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_IO_BITMAP),
75edce8a45486fe Sean Christopherson 2018-12-03   49  	EVMCS1_FIELD(MSR_BITM=
AP, msr_bitmap,
75edce8a45486fe Sean Christopherson 2018-12-03   50  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_MSR_BITMAP),
75edce8a45486fe Sean Christopherson 2018-12-03   51  	EVMCS1_FIELD(GUEST_ES=
_BASE, guest_es_base,
75edce8a45486fe Sean Christopherson 2018-12-03   52  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   53  	EVMCS1_FIELD(GUEST_CS=
_BASE, guest_cs_base,
75edce8a45486fe Sean Christopherson 2018-12-03   54  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   55  	EVMCS1_FIELD(GUEST_SS=
_BASE, guest_ss_base,
75edce8a45486fe Sean Christopherson 2018-12-03   56  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   57  	EVMCS1_FIELD(GUEST_DS=
_BASE, guest_ds_base,
75edce8a45486fe Sean Christopherson 2018-12-03   58  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   59  	EVMCS1_FIELD(GUEST_FS=
_BASE, guest_fs_base,
75edce8a45486fe Sean Christopherson 2018-12-03   60  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   61  	EVMCS1_FIELD(GUEST_GS=
_BASE, guest_gs_base,
75edce8a45486fe Sean Christopherson 2018-12-03   62  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   63  	EVMCS1_FIELD(GUEST_LD=
TR_BASE, guest_ldtr_base,
75edce8a45486fe Sean Christopherson 2018-12-03   64  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   65  	EVMCS1_FIELD(GUEST_TR=
_BASE, guest_tr_base,
75edce8a45486fe Sean Christopherson 2018-12-03   66  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   67  	EVMCS1_FIELD(GUEST_GD=
TR_BASE, guest_gdtr_base,
75edce8a45486fe Sean Christopherson 2018-12-03   68  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   69  	EVMCS1_FIELD(GUEST_ID=
TR_BASE, guest_idtr_base,
75edce8a45486fe Sean Christopherson 2018-12-03   70  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   71  	EVMCS1_FIELD(TSC_OFFS=
ET, tsc_offset,
75edce8a45486fe Sean Christopherson 2018-12-03   72  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   73  	EVMCS1_FIELD(VIRTUAL_=
APIC_PAGE_ADDR, virtual_apic_page_addr,
75edce8a45486fe Sean Christopherson 2018-12-03   74  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03   75  	EVMCS1_FIELD(VMCS_LIN=
K_POINTER, vmcs_link_pointer,
75edce8a45486fe Sean Christopherson 2018-12-03   76  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   77  	EVMCS1_FIELD(GUEST_IA=
32_DEBUGCTL, guest_ia32_debugctl,
75edce8a45486fe Sean Christopherson 2018-12-03   78  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   79  	EVMCS1_FIELD(GUEST_IA=
32_PAT, guest_ia32_pat,
75edce8a45486fe Sean Christopherson 2018-12-03   80  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   81  	EVMCS1_FIELD(GUEST_IA=
32_EFER, guest_ia32_efer,
75edce8a45486fe Sean Christopherson 2018-12-03   82  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  @83  	EVMCS1_FIELD(GUEST_IA=
32_PERF_GLOBAL_CTRL, guest_ia32_perf_global_ctrl,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21   84  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   85  	EVMCS1_FIELD(GUEST_PD=
PTR0, guest_pdptr0,
75edce8a45486fe Sean Christopherson 2018-12-03   86  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   87  	EVMCS1_FIELD(GUEST_PD=
PTR1, guest_pdptr1,
75edce8a45486fe Sean Christopherson 2018-12-03   88  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   89  	EVMCS1_FIELD(GUEST_PD=
PTR2, guest_pdptr2,
75edce8a45486fe Sean Christopherson 2018-12-03   90  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   91  	EVMCS1_FIELD(GUEST_PD=
PTR3, guest_pdptr3,
75edce8a45486fe Sean Christopherson 2018-12-03   92  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   93  	EVMCS1_FIELD(GUEST_PE=
NDING_DBG_EXCEPTIONS, guest_pending_dbg_exceptions,
75edce8a45486fe Sean Christopherson 2018-12-03   94  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   95  	EVMCS1_FIELD(GUEST_SY=
SENTER_ESP, guest_sysenter_esp,
75edce8a45486fe Sean Christopherson 2018-12-03   96  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   97  	EVMCS1_FIELD(GUEST_SY=
SENTER_EIP, guest_sysenter_eip,
75edce8a45486fe Sean Christopherson 2018-12-03   98  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03   99  	EVMCS1_FIELD(CR0_GUES=
T_HOST_MASK, cr0_guest_host_mask,
75edce8a45486fe Sean Christopherson 2018-12-03  100  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  101  	EVMCS1_FIELD(CR4_GUES=
T_HOST_MASK, cr4_guest_host_mask,
75edce8a45486fe Sean Christopherson 2018-12-03  102  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  103  	EVMCS1_FIELD(CR0_READ=
_SHADOW, cr0_read_shadow,
75edce8a45486fe Sean Christopherson 2018-12-03  104  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  105  	EVMCS1_FIELD(CR4_READ=
_SHADOW, cr4_read_shadow,
75edce8a45486fe Sean Christopherson 2018-12-03  106  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  107  	EVMCS1_FIELD(GUEST_CR=
0, guest_cr0,
75edce8a45486fe Sean Christopherson 2018-12-03  108  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  109  	EVMCS1_FIELD(GUEST_CR=
3, guest_cr3,
75edce8a45486fe Sean Christopherson 2018-12-03  110  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  111  	EVMCS1_FIELD(GUEST_CR=
4, guest_cr4,
75edce8a45486fe Sean Christopherson 2018-12-03  112  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  113  	EVMCS1_FIELD(GUEST_DR=
7, guest_dr7,
75edce8a45486fe Sean Christopherson 2018-12-03  114  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CRDR),
75edce8a45486fe Sean Christopherson 2018-12-03  115  	EVMCS1_FIELD(HOST_FS_=
BASE, host_fs_base,
75edce8a45486fe Sean Christopherson 2018-12-03  116  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe Sean Christopherson 2018-12-03  117  	EVMCS1_FIELD(HOST_GS_=
BASE, host_gs_base,
75edce8a45486fe Sean Christopherson 2018-12-03  118  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe Sean Christopherson 2018-12-03  119  	EVMCS1_FIELD(HOST_TR_=
BASE, host_tr_base,
75edce8a45486fe Sean Christopherson 2018-12-03  120  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe Sean Christopherson 2018-12-03  121  	EVMCS1_FIELD(HOST_GDT=
R_BASE, host_gdtr_base,
75edce8a45486fe Sean Christopherson 2018-12-03  122  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe Sean Christopherson 2018-12-03  123  	EVMCS1_FIELD(HOST_IDT=
R_BASE, host_idtr_base,
75edce8a45486fe Sean Christopherson 2018-12-03  124  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe Sean Christopherson 2018-12-03  125  	EVMCS1_FIELD(HOST_RSP=
, host_rsp,
75edce8a45486fe Sean Christopherson 2018-12-03  126  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe Sean Christopherson 2018-12-03  127  	EVMCS1_FIELD(EPT_POIN=
TER, ept_pointer,
75edce8a45486fe Sean Christopherson 2018-12-03  128  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_XLAT),
75edce8a45486fe Sean Christopherson 2018-12-03  129  	EVMCS1_FIELD(GUEST_BN=
DCFGS, guest_bndcfgs,
75edce8a45486fe Sean Christopherson 2018-12-03  130  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  131  	EVMCS1_FIELD(XSS_EXIT=
_BITMAP, xss_exit_bitmap,
75edce8a45486fe Sean Christopherson 2018-12-03  132  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP2),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21 @133  	EVMCS1_FIELD(ENCLS_EX=
ITING_BITMAP, encls_exiting_bitmap,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  134  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP2),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21 @135  	EVMCS1_FIELD(TSC_MULT=
IPLIER, tsc_multiplier,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  136  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP2),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  137  	/*
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  138  	 * Not used by KVM:
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  139  	 *
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  140  	 * EVMCS1_FIELD(0x000=
06828, guest_ia32_s_cet,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  141  	 *	     HV_VMX_ENLIGH=
TENED_CLEAN_FIELD_GUEST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  142  	 * EVMCS1_FIELD(0x000=
0682A, guest_ssp,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  143  	 *	     HV_VMX_ENLIGH=
TENED_CLEAN_FIELD_GUEST_BASIC),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  144  	 * EVMCS1_FIELD(0x000=
0682C, guest_ia32_int_ssp_table_addr,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  145  	 *	     HV_VMX_ENLIGH=
TENED_CLEAN_FIELD_GUEST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  146  	 * EVMCS1_FIELD(0x000=
02816, guest_ia32_lbr_ctl,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  147  	 *	     HV_VMX_ENLIGH=
TENED_CLEAN_FIELD_GUEST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  148  	 * EVMCS1_FIELD(0x000=
06C18, host_ia32_s_cet,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  149  	 *	     HV_VMX_ENLIGH=
TENED_CLEAN_FIELD_HOST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  150  	 * EVMCS1_FIELD(0x000=
06C1A, host_ssp,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  151  	 *	     HV_VMX_ENLIGH=
TENED_CLEAN_FIELD_HOST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  152  	 * EVMCS1_FIELD(0x000=
06C1C, host_ia32_int_ssp_table_addr,
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  153  	 *	     HV_VMX_ENLIGH=
TENED_CLEAN_FIELD_HOST_GRP1),
933b7b547c0b7e4 Vitaly Kuznetsov    2022-06-21  154  	 */
75edce8a45486fe Sean Christopherson 2018-12-03  155  =

75edce8a45486fe Sean Christopherson 2018-12-03  156  	/* 64 bit read only */
75edce8a45486fe Sean Christopherson 2018-12-03  157  	EVMCS1_FIELD(GUEST_PH=
YSICAL_ADDRESS, guest_physical_address,
75edce8a45486fe Sean Christopherson 2018-12-03  158  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  159  	EVMCS1_FIELD(EXIT_QUA=
LIFICATION, exit_qualification,
75edce8a45486fe Sean Christopherson 2018-12-03  160  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  161  	/*
75edce8a45486fe Sean Christopherson 2018-12-03  162  	 * Not defined in KVM:
75edce8a45486fe Sean Christopherson 2018-12-03  163  	 *
75edce8a45486fe Sean Christopherson 2018-12-03  164  	 * EVMCS1_FIELD(0x000=
06402, exit_io_instruction_ecx,
75edce8a45486fe Sean Christopherson 2018-12-03  165  	 *		HV_VMX_ENLIGHTENE=
D_CLEAN_FIELD_NONE);
75edce8a45486fe Sean Christopherson 2018-12-03  166  	 * EVMCS1_FIELD(0x000=
06404, exit_io_instruction_esi,
75edce8a45486fe Sean Christopherson 2018-12-03  167  	 *		HV_VMX_ENLIGHTENE=
D_CLEAN_FIELD_NONE);
75edce8a45486fe Sean Christopherson 2018-12-03  168  	 * EVMCS1_FIELD(0x000=
06406, exit_io_instruction_esi,
75edce8a45486fe Sean Christopherson 2018-12-03  169  	 *		HV_VMX_ENLIGHTENE=
D_CLEAN_FIELD_NONE);
75edce8a45486fe Sean Christopherson 2018-12-03  170  	 * EVMCS1_FIELD(0x000=
06408, exit_io_instruction_eip,
75edce8a45486fe Sean Christopherson 2018-12-03  171  	 *		HV_VMX_ENLIGHTENE=
D_CLEAN_FIELD_NONE);
75edce8a45486fe Sean Christopherson 2018-12-03  172  	 */
75edce8a45486fe Sean Christopherson 2018-12-03  173  	EVMCS1_FIELD(GUEST_LI=
NEAR_ADDRESS, guest_linear_address,
75edce8a45486fe Sean Christopherson 2018-12-03  174  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  175  =

75edce8a45486fe Sean Christopherson 2018-12-03  176  	/*
75edce8a45486fe Sean Christopherson 2018-12-03  177  	 * No mask defined in=
 the spec as Hyper-V doesn't currently support
75edce8a45486fe Sean Christopherson 2018-12-03  178  	 * these. Future proo=
f by resetting the whole clean field mask on
75edce8a45486fe Sean Christopherson 2018-12-03  179  	 * access.
75edce8a45486fe Sean Christopherson 2018-12-03  180  	 */
75edce8a45486fe Sean Christopherson 2018-12-03  181  	EVMCS1_FIELD(VM_EXIT_=
MSR_STORE_ADDR, vm_exit_msr_store_addr,
75edce8a45486fe Sean Christopherson 2018-12-03  182  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  183  	EVMCS1_FIELD(VM_EXIT_=
MSR_LOAD_ADDR, vm_exit_msr_load_addr,
75edce8a45486fe Sean Christopherson 2018-12-03  184  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  185  	EVMCS1_FIELD(VM_ENTRY=
_MSR_LOAD_ADDR, vm_entry_msr_load_addr,
75edce8a45486fe Sean Christopherson 2018-12-03  186  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  187  =

75edce8a45486fe Sean Christopherson 2018-12-03  188  	/* 32 bit rw */
75edce8a45486fe Sean Christopherson 2018-12-03  189  	EVMCS1_FIELD(TPR_THRE=
SHOLD, tpr_threshold,
75edce8a45486fe Sean Christopherson 2018-12-03  190  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  191  	EVMCS1_FIELD(GUEST_IN=
TERRUPTIBILITY_INFO, guest_interruptibility_info,
75edce8a45486fe Sean Christopherson 2018-12-03  192  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486fe Sean Christopherson 2018-12-03  193  	EVMCS1_FIELD(CPU_BASE=
D_VM_EXEC_CONTROL, cpu_based_vm_exec_control,
75edce8a45486fe Sean Christopherson 2018-12-03  194  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_PROC),
75edce8a45486fe Sean Christopherson 2018-12-03  195  	EVMCS1_FIELD(EXCEPTIO=
N_BITMAP, exception_bitmap,
75edce8a45486fe Sean Christopherson 2018-12-03  196  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_EXCPN),
75edce8a45486fe Sean Christopherson 2018-12-03  197  	EVMCS1_FIELD(VM_ENTRY=
_CONTROLS, vm_entry_controls,
75edce8a45486fe Sean Christopherson 2018-12-03  198  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_ENTRY),
75edce8a45486fe Sean Christopherson 2018-12-03  199  	EVMCS1_FIELD(VM_ENTRY=
_INTR_INFO_FIELD, vm_entry_intr_info_field,
75edce8a45486fe Sean Christopherson 2018-12-03  200  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486fe Sean Christopherson 2018-12-03  201  	EVMCS1_FIELD(VM_ENTRY=
_EXCEPTION_ERROR_CODE,
75edce8a45486fe Sean Christopherson 2018-12-03  202  		     vm_entry_except=
ion_error_code,
75edce8a45486fe Sean Christopherson 2018-12-03  203  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486fe Sean Christopherson 2018-12-03  204  	EVMCS1_FIELD(VM_ENTRY=
_INSTRUCTION_LEN, vm_entry_instruction_len,
75edce8a45486fe Sean Christopherson 2018-12-03  205  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486fe Sean Christopherson 2018-12-03  206  	EVMCS1_FIELD(HOST_IA3=
2_SYSENTER_CS, host_ia32_sysenter_cs,
75edce8a45486fe Sean Christopherson 2018-12-03  207  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  208  	EVMCS1_FIELD(PIN_BASE=
D_VM_EXEC_CONTROL, pin_based_vm_exec_control,
75edce8a45486fe Sean Christopherson 2018-12-03  209  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  210  	EVMCS1_FIELD(VM_EXIT_=
CONTROLS, vm_exit_controls,
75edce8a45486fe Sean Christopherson 2018-12-03  211  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  212  	EVMCS1_FIELD(SECONDAR=
Y_VM_EXEC_CONTROL, secondary_vm_exec_control,
75edce8a45486fe Sean Christopherson 2018-12-03  213  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  214  	EVMCS1_FIELD(GUEST_ES=
_LIMIT, guest_es_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  215  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  216  	EVMCS1_FIELD(GUEST_CS=
_LIMIT, guest_cs_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  217  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  218  	EVMCS1_FIELD(GUEST_SS=
_LIMIT, guest_ss_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  219  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  220  	EVMCS1_FIELD(GUEST_DS=
_LIMIT, guest_ds_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  221  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  222  	EVMCS1_FIELD(GUEST_FS=
_LIMIT, guest_fs_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  223  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  224  	EVMCS1_FIELD(GUEST_GS=
_LIMIT, guest_gs_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  225  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  226  	EVMCS1_FIELD(GUEST_LD=
TR_LIMIT, guest_ldtr_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  227  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  228  	EVMCS1_FIELD(GUEST_TR=
_LIMIT, guest_tr_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  229  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  230  	EVMCS1_FIELD(GUEST_GD=
TR_LIMIT, guest_gdtr_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  231  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  232  	EVMCS1_FIELD(GUEST_ID=
TR_LIMIT, guest_idtr_limit,
75edce8a45486fe Sean Christopherson 2018-12-03  233  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  234  	EVMCS1_FIELD(GUEST_ES=
_AR_BYTES, guest_es_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  235  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  236  	EVMCS1_FIELD(GUEST_CS=
_AR_BYTES, guest_cs_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  237  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  238  	EVMCS1_FIELD(GUEST_SS=
_AR_BYTES, guest_ss_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  239  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  240  	EVMCS1_FIELD(GUEST_DS=
_AR_BYTES, guest_ds_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  241  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  242  	EVMCS1_FIELD(GUEST_FS=
_AR_BYTES, guest_fs_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  243  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  244  	EVMCS1_FIELD(GUEST_GS=
_AR_BYTES, guest_gs_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  245  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  246  	EVMCS1_FIELD(GUEST_LD=
TR_AR_BYTES, guest_ldtr_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  247  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  248  	EVMCS1_FIELD(GUEST_TR=
_AR_BYTES, guest_tr_ar_bytes,
75edce8a45486fe Sean Christopherson 2018-12-03  249  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  250  	EVMCS1_FIELD(GUEST_AC=
TIVITY_STATE, guest_activity_state,
75edce8a45486fe Sean Christopherson 2018-12-03  251  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  252  	EVMCS1_FIELD(GUEST_SY=
SENTER_CS, guest_sysenter_cs,
75edce8a45486fe Sean Christopherson 2018-12-03  253  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  254  =

75edce8a45486fe Sean Christopherson 2018-12-03  255  	/* 32 bit read only */
75edce8a45486fe Sean Christopherson 2018-12-03  256  	EVMCS1_FIELD(VM_INSTR=
UCTION_ERROR, vm_instruction_error,
75edce8a45486fe Sean Christopherson 2018-12-03  257  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  258  	EVMCS1_FIELD(VM_EXIT_=
REASON, vm_exit_reason,
75edce8a45486fe Sean Christopherson 2018-12-03  259  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  260  	EVMCS1_FIELD(VM_EXIT_=
INTR_INFO, vm_exit_intr_info,
75edce8a45486fe Sean Christopherson 2018-12-03  261  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  262  	EVMCS1_FIELD(VM_EXIT_=
INTR_ERROR_CODE, vm_exit_intr_error_code,
75edce8a45486fe Sean Christopherson 2018-12-03  263  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  264  	EVMCS1_FIELD(IDT_VECT=
ORING_INFO_FIELD, idt_vectoring_info_field,
75edce8a45486fe Sean Christopherson 2018-12-03  265  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  266  	EVMCS1_FIELD(IDT_VECT=
ORING_ERROR_CODE, idt_vectoring_error_code,
75edce8a45486fe Sean Christopherson 2018-12-03  267  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  268  	EVMCS1_FIELD(VM_EXIT_=
INSTRUCTION_LEN, vm_exit_instruction_len,
75edce8a45486fe Sean Christopherson 2018-12-03  269  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  270  	EVMCS1_FIELD(VMX_INST=
RUCTION_INFO, vmx_instruction_info,
75edce8a45486fe Sean Christopherson 2018-12-03  271  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_NONE),
75edce8a45486fe Sean Christopherson 2018-12-03  272  =

75edce8a45486fe Sean Christopherson 2018-12-03  273  	/* No mask defined in=
 the spec (not used) */
75edce8a45486fe Sean Christopherson 2018-12-03  274  	EVMCS1_FIELD(PAGE_FAU=
LT_ERROR_CODE_MASK, page_fault_error_code_mask,
75edce8a45486fe Sean Christopherson 2018-12-03  275  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  276  	EVMCS1_FIELD(PAGE_FAU=
LT_ERROR_CODE_MATCH, page_fault_error_code_match,
75edce8a45486fe Sean Christopherson 2018-12-03  277  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  278  	EVMCS1_FIELD(CR3_TARG=
ET_COUNT, cr3_target_count,
75edce8a45486fe Sean Christopherson 2018-12-03  279  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  280  	EVMCS1_FIELD(VM_EXIT_=
MSR_STORE_COUNT, vm_exit_msr_store_count,
75edce8a45486fe Sean Christopherson 2018-12-03  281  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  282  	EVMCS1_FIELD(VM_EXIT_=
MSR_LOAD_COUNT, vm_exit_msr_load_count,
75edce8a45486fe Sean Christopherson 2018-12-03  283  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  284  	EVMCS1_FIELD(VM_ENTRY=
_MSR_LOAD_COUNT, vm_entry_msr_load_count,
75edce8a45486fe Sean Christopherson 2018-12-03  285  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_ALL),
75edce8a45486fe Sean Christopherson 2018-12-03  286  =

75edce8a45486fe Sean Christopherson 2018-12-03  287  	/* 16 bit rw */
75edce8a45486fe Sean Christopherson 2018-12-03  288  	EVMCS1_FIELD(HOST_ES_=
SELECTOR, host_es_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  289  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  290  	EVMCS1_FIELD(HOST_CS_=
SELECTOR, host_cs_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  291  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  292  	EVMCS1_FIELD(HOST_SS_=
SELECTOR, host_ss_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  293  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  294  	EVMCS1_FIELD(HOST_DS_=
SELECTOR, host_ds_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  295  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  296  	EVMCS1_FIELD(HOST_FS_=
SELECTOR, host_fs_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  297  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  298  	EVMCS1_FIELD(HOST_GS_=
SELECTOR, host_gs_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  299  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  300  	EVMCS1_FIELD(HOST_TR_=
SELECTOR, host_tr_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  301  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe Sean Christopherson 2018-12-03  302  	EVMCS1_FIELD(GUEST_ES=
_SELECTOR, guest_es_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  303  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  304  	EVMCS1_FIELD(GUEST_CS=
_SELECTOR, guest_cs_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  305  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  306  	EVMCS1_FIELD(GUEST_SS=
_SELECTOR, guest_ss_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  307  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  308  	EVMCS1_FIELD(GUEST_DS=
_SELECTOR, guest_ds_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  309  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  310  	EVMCS1_FIELD(GUEST_FS=
_SELECTOR, guest_fs_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  311  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  312  	EVMCS1_FIELD(GUEST_GS=
_SELECTOR, guest_gs_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  313  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  314  	EVMCS1_FIELD(GUEST_LD=
TR_SELECTOR, guest_ldtr_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  315  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  316  	EVMCS1_FIELD(GUEST_TR=
_SELECTOR, guest_tr_selector,
75edce8a45486fe Sean Christopherson 2018-12-03  317  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe Sean Christopherson 2018-12-03  318  	EVMCS1_FIELD(VIRTUAL_=
PROCESSOR_ID, virtual_processor_id,
75edce8a45486fe Sean Christopherson 2018-12-03  319  		     HV_VMX_ENLIGHTE=
NED_CLEAN_FIELD_CONTROL_XLAT),
75edce8a45486fe Sean Christopherson 2018-12-03  320  };
75edce8a45486fe Sean Christopherson 2018-12-03  321  const unsigned int nr_=
evmcs_1_fields =3D ARRAY_SIZE(vmcs_field_to_evmcs_1);
75edce8a45486fe Sean Christopherson 2018-12-03  322  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4117636026184446667==--

