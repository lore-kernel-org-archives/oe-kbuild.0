Content-Type: multipart/mixed; boundary="===============8676139130980572538=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH intel-tdx] KVM: TDX: tdx_caps can be static
Date: Wed, 01 Sep 2021 06:45:22 +0800
Message-ID: <20210831224522.GA108623@5e0d33572a23>
In-Reply-To: <202109010649.vkPADInF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8676139130980572538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Christopherson <sean.j.christopherson@intel.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>
CC: Xiaoyao Li <xiaoyao.li@intel.com>
CC: Kai Huang <kai.huang@linux.intel.com>
CC: Chao Gao <chao.gao@intel.com>
CC: Yuan Yao <yuan.yao@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Wanpeng Li <wanpengli@tencent.com>
CC: Jim Mattson <jmattson@google.com>

arch/x86/kvm/vmx/tdx.c:50:25: warning: symbol 'tdx_caps' was not declared. =
Should it be static?

Fixes: aca8529f73f7 ("KVM: TDX: Add "basic" support for building and runnin=
g Trust Domains")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 tdx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 19491fe423fed..7f67e71e92d2d 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -47,7 +47,7 @@ void tdx_keyid_free(int keyid)
 }
 =

 /* Capabilities of KVM + TDX-SEAM. */
-struct tdx_capabilities tdx_caps;
+static struct tdx_capabilities tdx_caps;
 =

 static struct mutex *tdx_phymem_cache_wb_lock;
 static struct mutex *tdx_mng_key_config_lock;
--===============8676139130980572538==--

