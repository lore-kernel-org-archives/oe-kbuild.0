Content-Type: multipart/mixed; boundary="===============5275388255198096378=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvm:queue 194/222] Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' differs from latest version at 'arch/x86/include/uapi/asm/kvm.h': 162> struct kvm_sregs2 {
Date: Fri, 11 Jun 2021 03:42:47 +0800
Message-ID: <202106110339.IWCRrleM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5275388255198096378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: kvm(a)vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Maxim Levitsky <mlevitsk@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   c1dc20e254b421a2463da7f053b37d822788224a
commit: b5a0973f6b6c9159bc64f89edf7a32f5821c84c0 [194/222] KVM: x86: Introd=
uce KVM_GET_SREGS2 / KVM_SET_SREGS2
:::::: branch date: 3 hours ago
:::::: commit date: 4 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  162> struc=
t kvm_sregs2 {
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  163> 	/* o=
ut (KVM_GET_SREGS2) / in (KVM_SET_SREGS2) */
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  164> 	stru=
ct kvm_segment cs, ds, es, fs, gs, ss;
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  165> 	stru=
ct kvm_segment tr, ldt;
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  166> 	stru=
ct kvm_dtable gdt, idt;
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  167> 	__u6=
4 cr0, cr2, cr3, cr4, cr8;
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  168> 	__u6=
4 efer;
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  169> 	__u6=
4 apic_base;
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  170> 	__u6=
4 flags;
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  171> 	__u6=
4 pdptrs[4];
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  172> };
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  173> #defi=
ne KVM_SREGS2_FLAGS_PDPTRS_VALID 1
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  174> =

   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  452> =

   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  453> 	__u1=
6 pad;
--
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
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1087> #define KVM_CAP_SRE=
GS2 200
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1626> #define KVM_GET_SRE=
GS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1627> #define KVM_SET_SRE=
GS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1628> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1684> 	/* Guest Migration=
 Extension */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1685> 	KVM_SEV_SEND_CANCE=
L,
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1742> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1743> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1744> struct kvm_sev_send=
_start {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1745> 	__u32 policy;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1746> 	__u64 pdh_cert_uad=
dr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1747> 	__u32 pdh_cert_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1748> 	__u64 plat_certs_u=
addr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1749> 	__u32 plat_certs_l=
en;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1750> 	__u64 amd_certs_ua=
ddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1751> 	__u32 amd_certs_le=
n;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1752> 	__u64 session_uadd=
r;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1753> 	__u32 session_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1754> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1755> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1756> struct kvm_sev_send=
_update_data {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1757> 	__u64 hdr_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1758> 	__u32 hdr_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1759> 	__u64 guest_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1760> 	__u32 guest_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1761> 	__u64 trans_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1762> 	__u32 trans_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1763> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1764> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1765> struct kvm_sev_rece=
ive_start {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1766> 	__u32 handle;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1767> 	__u32 policy;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1768> 	__u64 pdh_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1769> 	__u32 pdh_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1770> 	__u64 session_uadd=
r;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1771> 	__u32 session_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1772> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1773> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1774> struct kvm_sev_rece=
ive_update_data {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1775> 	__u64 hdr_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1776> 	__u32 hdr_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1777> 	__u64 guest_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1778> 	__u32 guest_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1779> 	__u64 trans_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1780> 	__u32 trans_len;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5275388255198096378==--

