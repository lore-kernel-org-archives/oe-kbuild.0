Content-Type: multipart/mixed; boundary="===============1386202604868574325=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/4.14 8620/9999] drivers/pci/msi.c:727:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Mon, 14 Feb 2022 06:42:56 +0800
Message-ID: <202202140645.MijZnh5d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1386202604868574325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Sasha Levin <sashal@kernel.org>
CC: Marc Zyngier <maz@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/q=
ueue/4.14
head:   0a76088e7a7af30aafbbb726d9d52d54eeba3ad0
commit: e1d5e8a561baaafed6e35d72a6ad53d248580d6c [8620/9999] PCI/MSI: Mask =
all unused MSI-X entries
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
compiler: ia64-linux-gcc (GCC) 7.5.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/ksm.c:1589:30: warning: Boolean result is used in bitwise operation. =
Clarify expression with parentheses. [clarifyCondition]
     VM_BUG_ON(!stable_node_dup ^ !!stable_node_any);
                                ^
   mm/ksm.c:1818:30: warning: Boolean result is used in bitwise operation. =
Clarify expression with parentheses. [clarifyCondition]
     VM_BUG_ON(!stable_node_dup ^ !!stable_node_any);
                                ^
   mm/ksm.c:570:36: warning: Same value in both branches of ternary operato=
r. [duplicateValueTernary]
    return ksm_merge_across_nodes ? 0 : NUMA(pfn_to_nid(kpfn));
                                      ^
>> mm/ksm.c:576:22: warning: Local variable chain shadows outer function [s=
hadowFunction]
    struct stable_node *chain =3D alloc_stable_node();
                        ^
   mm/ksm.c:1502:37: note: Shadowed declaration
   static __always_inline struct page *chain(struct stable_node **s_n_d,
                                       ^
   mm/ksm.c:576:22: note: Shadow variable
    struct stable_node *chain =3D alloc_stable_node();
                        ^
>> mm/ksm.c:1530:36: warning: Local variable stable_node_dup shadows outer =
function [shadowFunction]
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
   mm/ksm.c:1327:14: note: Shadowed declaration
   struct page *stable_node_dup(struct stable_node **_stable_node_dup,
                ^
   mm/ksm.c:1530:36: note: Shadow variable
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
   mm/ksm.c:1777:36: warning: Local variable stable_node_dup shadows outer =
function [shadowFunction]
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
   mm/ksm.c:1327:14: note: Shadowed declaration
   struct page *stable_node_dup(struct stable_node **_stable_node_dup,
                ^
   mm/ksm.c:1777:36: note: Shadow variable
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
>> drivers/pci/msi.c:727:4: warning: Assignment of function parameter has n=
o effect outside the function. Did you forget dereferencing it? [uselessAss=
ignmentPtrArg]
      entries++;
      ^

vim +727 drivers/pci/msi.c

d9d7070e611765 Hidetoshi Seto  2009-08-06  719  =

e1d5e8a561baaa Thomas Gleixner 2021-07-29  720  static void msix_update_ent=
ries(struct pci_dev *dev, struct msix_entry *entries)
75cb3426878d47 Hidetoshi Seto  2009-08-06  721  {
75cb3426878d47 Hidetoshi Seto  2009-08-06  722  	struct msi_desc *entry;
75cb3426878d47 Hidetoshi Seto  2009-08-06  723  =

5004e98a91e8ad Jiang Liu       2015-07-09  724  	for_each_pci_msi_entry(ent=
ry, dev) {
e1d5e8a561baaa Thomas Gleixner 2021-07-29  725  		if (entries) {
e1d5e8a561baaa Thomas Gleixner 2021-07-29  726  			entries->vector =3D entr=
y->irq;
e1d5e8a561baaa Thomas Gleixner 2021-07-29 @727  			entries++;
e1d5e8a561baaa Thomas Gleixner 2021-07-29  728  		}
75cb3426878d47 Hidetoshi Seto  2009-08-06  729  	}
75cb3426878d47 Hidetoshi Seto  2009-08-06  730  }
75cb3426878d47 Hidetoshi Seto  2009-08-06  731  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1386202604868574325==--

