Content-Type: multipart/mixed; boundary="===============1445504729772377081=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] KVM, SEV: Add support for SEV local migration
Date: Tue, 22 Jun 2021 02:49:04 +0800
Message-ID: <202106220231.M0mOLhuS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1445504729772377081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210621163118.1040170-3-pgonda@google.com>
References: <20210621163118.1040170-3-pgonda@google.com>
TO: Peter Gonda <pgonda@google.com>
TO: kvm(a)vger.kernel.org
CC: Peter Gonda <pgonda@google.com>
CC: Lars Bull <larsbull@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>
CC: David Rientjes <rientjes@google.com>
CC: "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Brijesh Singh <brijesh.singh@amd.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Wanpeng Li <wanpengli@tencent.com>

Hi Peter,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on f1b8325508327a302f1d5cd8a4bf51e2c9c72fa9]

url:    https://github.com/0day-ci/linux/commits/Peter-Gonda/Add-AMD-SEV-an=
d-SEV-ES-local-migration-support/20210622-010026
base:   f1b8325508327a302f1d5cd8a4bf51e2c9c72fa9
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
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
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1627> #define KVM_GET_SRE=
GS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1628> #define KVM_SET_SRE=
GS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1629> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1685> 	/* Guest Migration=
 Extension */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1686> 	KVM_SEV_SEND_CANCE=
L,
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1687> 	/* Local migration=
 commands */
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1688> 	KVM_SEV_LOCAL_SEND,
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1689> 	KVM_SEV_LOCAL_RECE=
IVE,
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1746> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1747> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1748> struct kvm_sev_send=
_start {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1749> 	__u32 policy;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1750> 	__u64 pdh_cert_uad=
dr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1751> 	__u32 pdh_cert_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1752> 	__u64 plat_certs_u=
addr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1753> 	__u32 plat_certs_l=
en;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1754> 	__u64 amd_certs_ua=
ddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1755> 	__u32 amd_certs_le=
n;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1756> 	__u64 session_uadd=
r;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1757> 	__u32 session_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1758> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1759> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1760> struct kvm_sev_send=
_update_data {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1761> 	__u64 hdr_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1762> 	__u32 hdr_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1763> 	__u64 guest_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1764> 	__u32 guest_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1765> 	__u64 trans_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1766> 	__u32 trans_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1767> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1768> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1769> struct kvm_sev_rece=
ive_start {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1770> 	__u32 handle;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1771> 	__u32 policy;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1772> 	__u64 pdh_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1773> 	__u32 pdh_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1774> 	__u64 session_uadd=
r;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1775> 	__u32 session_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1776> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1777> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1778> struct kvm_sev_rece=
ive_update_data {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1779> 	__u64 hdr_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1780> 	__u32 hdr_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1781> 	__u64 guest_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1782> 	__u32 guest_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1783> 	__u64 trans_uaddr;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1784> 	__u32 trans_len;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1785> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1786> =

>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1787> struct kvm_sev_loca=
l_send {
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1788> 	__u64 info_token;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1789> };
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1790> =

>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1791> struct kvm_sev_loca=
l_receive {
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1792> 	__u64 info_token;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1793> 	__u32 handle;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1445504729772377081==--

