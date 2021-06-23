Content-Type: multipart/mixed; boundary="===============7342459034398545857=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvm:queue 329/331] Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h': 283> /* Flags that describe what fields in emulation_failure hold valid data. */
Date: Thu, 24 Jun 2021 07:43:01 +0800
Message-ID: <202106240753.UVbYA5yL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7342459034398545857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: kvm(a)vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Aaron Lewis <aaronlewis@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: David Edmondson <david.edmondson@oracle.com>
CC: Jim Mattson <jmattson@google.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   42ac670e03c13e78b43177569bea49540d22661e
commit: 3bd33d3f648e99bdf93f327f2abc40962d740b9c [329/331] kvm: x86: Allow =
userspace to handle emulation errors
:::::: branch date: 61 minutes ago
:::::: commit date: 61 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  283> /* Flags that descr=
ibe what fields in emulation_failure hold valid data. */
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  284> #define KVM_INTERNA=
L_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h':  285> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  389> 		/*
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  390> 		 * KVM_INTERNAL_E=
RROR_EMULATION
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  391> 		 *
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  392> 		 * "struct emulat=
ion_failure" is an overlay of "struct internal"
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  393> 		 * that is used f=
or the KVM_INTERNAL_ERROR_EMULATION sub-type of
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  394> 		 * KVM_EXIT_INTER=
NAL_ERROR.  Note, unlike other internal error
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  395> 		 * sub-types, thi=
s struct is ABI!  It also needs to be backwards
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  396> 		 * compatible wit=
h "struct internal".  Take special care that
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  397> 		 * "ndata" is cor=
rect, that new fields are enumerated in "flags",
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  398> 		 * and that each =
flag enumerates fields that are 64-bit aligned
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  399> 		 * and sized (so =
that ndata+internal.data[] is valid/accurate).
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  400> 		 */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  401> 		struct {
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  402> 			__u32 suberror;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  403> 			__u32 ndata;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  404> 			__u64 flags;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  405> 			__u8  insn_size;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h':  406> 			__u8  insn_bytes=
[15];
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
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
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1113> #define KVM_CAP_EXI=
T_ON_EMULATION_FAILURE 204
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1652> #define KVM_GET_SRE=
GS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1653> #define KVM_SET_SRE=
GS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1654> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1932> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1933> /**
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1934>  * struct kvm_stats=
_header - Header of per vm/vcpu binary statistics data.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1935>  * @flags: Some ext=
ra information for header, always 0 for now.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1936>  * @name_size: The =
size in bytes of the memory which contains statistics
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1937>  *             name=
 string including trailing '\0'. The memory is allocated
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1938>  *             at t=
he send of statistics descriptor.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1939>  * @num_desc: The n=
umber of statistics the vm or vcpu has.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1940>  * @id_offset: The =
offset of the vm/vcpu stats' id string in the file pointed
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1941>  *             by v=
m/vcpu stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1942>  * @desc_offset: Th=
e offset of the vm/vcpu stats' descriptor block in the file
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1943>  *               po=
intd by vm/vcpu stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1944>  * @data_offset: Th=
e offset of the vm/vcpu stats' data block in the file
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1945>  *               po=
inted by vm/vcpu stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1946>  *
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1947>  * This is the head=
er userspace needs to read from stats fd before any other
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1948>  * readings. It is =
used by userspace to discover all the information about the
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1949>  * vm/vcpu's binary=
 statistics.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1950>  * Userspace reads =
this header from the start of the vm/vcpu's stats fd.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1951>  */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1952> struct kvm_stats_he=
ader {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1953> 	__u32 flags;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1954> 	__u32 name_size;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1955> 	__u32 num_desc;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1956> 	__u32 id_offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1957> 	__u32 desc_offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1958> 	__u32 data_offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1959> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1960> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1961> #define KVM_STATS_T=
YPE_SHIFT		0
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1962> #define KVM_STATS_T=
YPE_MASK		(0xF << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1963> #define KVM_STATS_T=
YPE_CUMULATIVE	(0x0 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1964> #define KVM_STATS_T=
YPE_INSTANT		(0x1 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1965> #define KVM_STATS_T=
YPE_PEAK		(0x2 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1966> #define KVM_STATS_T=
YPE_MAX		KVM_STATS_TYPE_PEAK
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1967> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1968> #define KVM_STATS_U=
NIT_SHIFT		4
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1969> #define KVM_STATS_U=
NIT_MASK		(0xF << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1970> #define KVM_STATS_U=
NIT_NONE		(0x0 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1971> #define KVM_STATS_U=
NIT_BYTES		(0x1 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1972> #define KVM_STATS_U=
NIT_SECONDS		(0x2 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1973> #define KVM_STATS_U=
NIT_CYCLES		(0x3 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1974> #define KVM_STATS_U=
NIT_MAX		KVM_STATS_UNIT_CYCLES
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1975> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1976> #define KVM_STATS_B=
ASE_SHIFT		8
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1977> #define KVM_STATS_B=
ASE_MASK		(0xF << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1978> #define KVM_STATS_B=
ASE_POW10		(0x0 << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1979> #define KVM_STATS_B=
ASE_POW2		(0x1 << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1980> #define KVM_STATS_B=
ASE_MAX		KVM_STATS_BASE_POW2
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1981> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1982> /**
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1983>  * struct kvm_stats=
_desc - Descriptor of a KVM statistics.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1984>  * @flags: Annotati=
ons of the stats, like type, unit, etc.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1985>  * @exponent: Used =
together with @flags to determine the unit.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1986>  * @size: The numbe=
r of data items for this stats.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1987>  *        Every dat=
a item is of type __u64.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1988>  * @offset: The off=
set of the stats to the start of stat structure in
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1989>  *          strutur=
e kvm or kvm_vcpu.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1990>  * @unused: Unused =
field for future usage. Always 0 for now.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1991>  * @name: The name =
string for the stats. Its size is indicated by the
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1992>  *        &kvm_stat=
s_header->name_size.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1993>  */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1994> struct kvm_stats_de=
sc {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1995> 	__u32 flags;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1996> 	__s16 exponent;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1997> 	__u16 size;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1998> 	__u32 offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1999> 	__u32 unused;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2000> 	char name[];
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2001> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2002> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 2003> #define KVM_GET_STA=
TS_FD  _IO(KVMIO,  0xce)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7342459034398545857==--

