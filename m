Content-Type: multipart/mixed; boundary="===============0628046029855095072=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 01/12] KVM: x86: Report host tsc and realtime values in KVM_GET_CLOCK
Date: Mon, 19 Jul 2021 04:14:17 +0800
Message-ID: <202107190400.9rNI96R6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0628046029855095072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210716212629.2232756-2-oupton@google.com>
References: <20210716212629.2232756-2-oupton@google.com>
TO: Oliver Upton <oupton@google.com>
TO: kvm(a)vger.kernel.org
TO: kvmarm(a)lists.cs.columbia.edu
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>
CC: Peter Shier <pshier@google.com>
CC: Jim Mattson <jmattson@google.com>
CC: David Matlack <dmatlack@google.com>
CC: Ricardo Koller <ricarkol@google.com>
CC: Jing Zhang <jingzhangos@google.com>

Hi Oliver,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvm/queue]
[also build test WARNING on vhost/linux-next v5.14-rc1 next-20210716]
[cannot apply to kvmarm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oliver-Upton/KVM-Add-idemp=
otent-controls-for-migrating-system-counter-state/20210718-103407
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  283> /* Flags that descr=
ibe what fields in emulation_failure hold valid data. */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  284> #define KVM_INTERNA=
L_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h':  285> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  389> 		/*
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  390> 		 * KVM_INTERNAL_E=
RROR_EMULATION
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  391> 		 *
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  392> 		 * "struct emulat=
ion_failure" is an overlay of "struct internal"
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  393> 		 * that is used f=
or the KVM_INTERNAL_ERROR_EMULATION sub-type of
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  394> 		 * KVM_EXIT_INTER=
NAL_ERROR.  Note, unlike other internal error
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  395> 		 * sub-types, thi=
s struct is ABI!  It also needs to be backwards
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  396> 		 * compatible wit=
h "struct internal".  Take special care that
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  397> 		 * "ndata" is cor=
rect, that new fields are enumerated in "flags",
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  398> 		 * and that each =
flag enumerates fields that are 64-bit aligned
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  399> 		 * and sized (so =
that ndata+internal.data[] is valid/accurate).
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  400> 		 */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  401> 		struct {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  402> 			__u32 suberror;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  403> 			__u32 ndata;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  404> 			__u64 flags;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  405> 			__u8  insn_size;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  406> 			__u8  insn_bytes=
[15];
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  407> 		} emulation_failu=
re;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1108> #define KVM_CAP_HYP=
ERV_ENFORCE_CPUID 199
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1109> #define KVM_CAP_SRE=
GS2 200
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1110> #define KVM_CAP_EXI=
T_HYPERCALL 201
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1111> #define KVM_CAP_PPC=
_RPT_INVALIDATE 202
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1112> #define KVM_CAP_BIN=
ARY_STATS_FD 203
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1113> #define KVM_CAP_EXI=
T_ON_EMULATION_FAILURE 204
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1114> #define KVM_CAP_ARM=
_MTE 205
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1226> #define KVM_CLOCK_R=
EAL_TIME		(1 << 2)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1227> #define KVM_CLOCK_H=
OST_TSC		(1 << 3)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1201< 	__u32 pad[9];
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1232> 	__u32 pad0;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1233> 	__u64 realtime;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1234> 	__u64 host_tsc;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1235> 	__u32 pad[4];
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1465> #define KVM_ARM_MTE=
_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1659> #define KVM_GET_SRE=
GS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1660> #define KVM_SET_SRE=
GS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1661> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1939> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1940> /**
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1941>  * struct kvm_stats=
_header - Header of per vm/vcpu binary statistics data.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1942>  * @flags: Some ext=
ra information for header, always 0 for now.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1943>  * @name_size: The =
size in bytes of the memory which contains statistics
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1944>  *             name=
 string including trailing '\0'. The memory is allocated
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1945>  *             at t=
he send of statistics descriptor.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1946>  * @num_desc: The n=
umber of statistics the vm or vcpu has.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1947>  * @id_offset: The =
offset of the vm/vcpu stats' id string in the file pointed
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1948>  *             by v=
m/vcpu stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1949>  * @desc_offset: Th=
e offset of the vm/vcpu stats' descriptor block in the file
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1950>  *               po=
intd by vm/vcpu stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1951>  * @data_offset: Th=
e offset of the vm/vcpu stats' data block in the file
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1952>  *               po=
inted by vm/vcpu stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1953>  *
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1954>  * This is the head=
er userspace needs to read from stats fd before any other
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1955>  * readings. It is =
used by userspace to discover all the information about the
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1956>  * vm/vcpu's binary=
 statistics.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1957>  * Userspace reads =
this header from the start of the vm/vcpu's stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1958>  */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1959> struct kvm_stats_he=
ader {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1960> 	__u32 flags;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1961> 	__u32 name_size;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1962> 	__u32 num_desc;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1963> 	__u32 id_offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1964> 	__u32 desc_offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1965> 	__u32 data_offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1966> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1967> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1968> #define KVM_STATS_T=
YPE_SHIFT		0
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1969> #define KVM_STATS_T=
YPE_MASK		(0xF << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1970> #define KVM_STATS_T=
YPE_CUMULATIVE	(0x0 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1971> #define KVM_STATS_T=
YPE_INSTANT		(0x1 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1972> #define KVM_STATS_T=
YPE_PEAK		(0x2 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1973> #define KVM_STATS_T=
YPE_MAX		KVM_STATS_TYPE_PEAK
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1974> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1975> #define KVM_STATS_U=
NIT_SHIFT		4
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1976> #define KVM_STATS_U=
NIT_MASK		(0xF << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1977> #define KVM_STATS_U=
NIT_NONE		(0x0 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1978> #define KVM_STATS_U=
NIT_BYTES		(0x1 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1979> #define KVM_STATS_U=
NIT_SECONDS		(0x2 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1980> #define KVM_STATS_U=
NIT_CYCLES		(0x3 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1981> #define KVM_STATS_U=
NIT_MAX		KVM_STATS_UNIT_CYCLES
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1982> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1983> #define KVM_STATS_B=
ASE_SHIFT		8
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1984> #define KVM_STATS_B=
ASE_MASK		(0xF << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1985> #define KVM_STATS_B=
ASE_POW10		(0x0 << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1986> #define KVM_STATS_B=
ASE_POW2		(0x1 << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1987> #define KVM_STATS_B=
ASE_MAX		KVM_STATS_BASE_POW2
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1988> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1989> /**
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1990>  * struct kvm_stats=
_desc - Descriptor of a KVM statistics.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1991>  * @flags: Annotati=
ons of the stats, like type, unit, etc.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1992>  * @exponent: Used =
together with @flags to determine the unit.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1993>  * @size: The numbe=
r of data items for this stats.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1994>  *        Every dat=
a item is of type __u64.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1995>  * @offset: The off=
set of the stats to the start of stat structure in
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1996>  *          strutur=
e kvm or kvm_vcpu.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1997>  * @unused: Unused =
field for future usage. Always 0 for now.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1998>  * @name: The name =
string for the stats. Its size is indicated by the
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1999>  *        &kvm_stat=
s_header->name_size.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2000>  */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2001> struct kvm_stats_de=
sc {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2002> 	__u32 flags;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2003> 	__s16 exponent;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2004> 	__u16 size;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2005> 	__u32 offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2006> 	__u32 unused;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2007> 	char name[];
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2008> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2009> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2010> #define KVM_GET_STA=
TS_FD  _IO(KVMIO,  0xce)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0628046029855095072==--

