Content-Type: multipart/mixed; boundary="===============3404823767454230446=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvm:queue 228/230] Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h': 1089> #define KVM_CAP_BINARY_STATS_FD 202
Date: Sat, 12 Jun 2021 02:00:50 +0800
Message-ID: <202106120247.Ta3wgqCc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3404823767454230446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: kvm(a)vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Jing Zhang <jingzhangos@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: David Matlack <dmatlack@google.com>
CC: Ricardo Koller <ricarkol@google.com>
CC: Krish Sadhukhan <krish.sadhukhan@oracle.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   39be2e28180a2e87af5fbb8d83643812e1a3b371
commit: 280191127b850d9d07b26076dbdf2e7dacec562a [228/230] KVM: stats: Add =
fd-based API to read binary stats data
:::::: branch date: 68 minutes ago
:::::: commit date: 68 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1082> #define KVM_CAP_SET=
_GUEST_DEBUG2 195
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1083> #define KVM_CAP_SGX=
_ATTRIBUTE 196
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1084> #define KVM_CAP_VM_=
COPY_ENC_CONTEXT_FROM 197
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1085> #define KVM_CAP_PTP=
_KVM 198
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1086> #define KVM_CAP_HYP=
ERV_ENFORCE_CPUID 199
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1087> #define KVM_CAP_SRE=
GS2 200
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1088> #define KVM_CAP_EXI=
T_HYPERCALL 201
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1089> #define KVM_CAP_BIN=
ARY_STATS_FD 202
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1628> #define KVM_GET_SRE=
GS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1629> #define KVM_SET_SRE=
GS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1630> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1686> 	/* Guest Migration=
 Extension */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1687> 	KVM_SEV_SEND_CANCE=
L,
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1746> struct kvm_sev_send=
_start {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1747> 	__u32 policy;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1748> 	__u64 pdh_cert_uad=
dr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1749> 	__u32 pdh_cert_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1750> 	__u64 plat_certs_u=
addr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1751> 	__u32 plat_certs_l=
en;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1752> 	__u64 amd_certs_ua=
ddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1753> 	__u32 amd_certs_le=
n;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1754> 	__u64 session_uadd=
r;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1755> 	__u32 session_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1756> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1757> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1758> struct kvm_sev_send=
_update_data {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1759> 	__u64 hdr_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1760> 	__u32 hdr_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1761> 	__u64 guest_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1762> 	__u32 guest_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1763> 	__u64 trans_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1764> 	__u32 trans_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1765> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1766> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1767> struct kvm_sev_rece=
ive_start {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1768> 	__u32 handle;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1769> 	__u32 policy;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1770> 	__u64 pdh_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1771> 	__u32 pdh_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1772> 	__u64 session_uadd=
r;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1773> 	__u32 session_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1774> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1775> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1776> struct kvm_sev_rece=
ive_update_data {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1777> 	__u64 hdr_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1778> 	__u32 hdr_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1779> 	__u64 guest_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1780> 	__u32 guest_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1781> 	__u64 trans_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1782> 	__u32 trans_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1783> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1784> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1908> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1909> #define KVM_STATS_I=
D_MAXLEN		64
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1910> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1911> struct kvm_stats_he=
ader {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1912> 	__u32 name_size;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1913> 	__u32 count;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1914> 	__u32 desc_offset;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1915> 	__u32 data_offset;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1916> 	char id[0];
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1917> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1918> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1919> #define KVM_STATS_T=
YPE_SHIFT		0
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1920> #define KVM_STATS_T=
YPE_MASK		(0xF << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1921> #define KVM_STATS_T=
YPE_CUMULATIVE	(0x0 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1922> #define KVM_STATS_T=
YPE_INSTANT		(0x1 << KVM_STATS_TYPE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1923> #define KVM_STATS_T=
YPE_MAX		KVM_STATS_TYPE_INSTANT
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1924> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1925> #define KVM_STATS_U=
NIT_SHIFT		4
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1926> #define KVM_STATS_U=
NIT_MASK		(0xF << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1927> #define KVM_STATS_U=
NIT_NONE		(0x0 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1928> #define KVM_STATS_U=
NIT_BYTES		(0x1 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1929> #define KVM_STATS_U=
NIT_SECONDS		(0x2 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1930> #define KVM_STATS_U=
NIT_CYCLES		(0x3 << KVM_STATS_UNIT_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1931> #define KVM_STATS_U=
NIT_MAX		KVM_STATS_UNIT_CYCLES
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1932> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1933> #define KVM_STATS_B=
ASE_SHIFT		8
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1934> #define KVM_STATS_B=
ASE_MASK		(0xF << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1935> #define KVM_STATS_B=
ASE_POW10		(0x0 << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1936> #define KVM_STATS_B=
ASE_POW2		(0x1 << KVM_STATS_BASE_SHIFT)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version@'include/uapi/linux/kvm.h': 1937> #define KVM_STATS_B=
ASE_MAX		KVM_STATS_BASE_POW2
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1938> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1939> struct kvm_stats_de=
sc {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1940> 	__u32 flags;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1941> 	__s16 exponent;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1942> 	__u16 size;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1943> 	__u32 unused1;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1944> 	__u32 unused2;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1945> 	char name[0];
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1946> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1947> =

>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1948> struct kvm_stats_da=
ta {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1949> 	__u64 value[0];
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1950> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1951> =

>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1952> #define KVM_GET_STA=
TS_FD  _IO(KVMIO,  0xce)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3404823767454230446==--

