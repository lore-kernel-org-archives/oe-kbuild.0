Content-Type: multipart/mixed; boundary="===============1564024305621436499=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 09/24] dept: Apply Dept to seqlock
Date: Thu, 10 Mar 2022 11:22:42 +0800
Message-ID: <202203101159.1eFVxMBQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1564024305621436499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1646377603-19730-10-git-send-email-byungchul.park@lge.com>
References: <1646377603-19730-10-git-send-email-byungchul.park@lge.com>
TO: Byungchul Park <byungchul.park@lge.com>
TO: torvalds(a)linux-foundation.org
CC: hamohammed.sa(a)gmail.com
CC: jack(a)suse.cz
CC: peterz(a)infradead.org
CC: daniel.vetter(a)ffwll.ch
CC: amir73il(a)gmail.com
CC: david(a)fromorbit.com
CC: dri-devel(a)lists.freedesktop.org
CC: chris(a)chris-wilson.co.uk
CC: bfields(a)fieldses.org
CC: linux-ide(a)vger.kernel.org
CC: adilger.kernel(a)dilger.ca
CC: joel(a)joelfernandes.org
CC: cl(a)linux.com
CC: will(a)kernel.org
CC: duyuyang(a)gmail.com
CC: sashal(a)kernel.org
CC: paolo.valente(a)linaro.org
CC: damien.lemoal(a)opensource.wdc.com
CC: willy(a)infradead.org
CC: hch(a)infradead.org
CC: airlied(a)linux.ie
CC: mingo(a)redhat.com
CC: djwong(a)kernel.org
CC: vdavydov.dev(a)gmail.com
CC: rientjes(a)google.com
CC: dennis(a)kernel.org
CC: linux-ext4(a)vger.kernel.org
CC: linux-mm(a)kvack.org
CC: ngupta(a)vflare.org

Hi Byungchul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linux/master linus/master v5.17-rc7]
[cannot apply to tip/locking/core hnaz-mm/master next-20220309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Byungchul-Park/DEPT-Depend=
ency-Tracker/20220304-150943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 25795ef=
6299f07ce3838f3253a9cb34f64efcfae
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-m031-20220307 (https://download.01.org/0day-ci/arch=
ive/20220310/202203101159.1eFVxMBQ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kvm/../../../virt/kvm/eventfd.c:264 irqfd_update() warn: statement=
 has no effect 31
arch/x86/kvm/../../../virt/kvm/eventfd.c:560 kvm_irqfd_deassign() warn: sta=
tement has no effect 31
arch/x86/kvm/x86.c:2852 kvm_end_pvclock_update() warn: statement has no eff=
ect 31
drivers/md/raid5.c:8241 raid5_start_reshape() warn: statement has no effect=
 31

Old smatch warnings:
arch/x86/kvm/x86.c:1021 __kvm_set_xcr() warn: bitwise AND condition is fals=
e here
arch/x86/kvm/x86.c:1022 __kvm_set_xcr() warn: bitwise AND condition is fals=
e here
arch/x86/kvm/x86.c:5135 kvm_arch_tsc_set_attr() warn: check for integer ove=
rflow 'offset'
arch/x86/kvm/x86.c:5176 kvm_vcpu_ioctl_device_attr() error: uninitialized s=
ymbol 'r'.
arch/x86/kvm/x86.c:9569 enter_smm() warn: inconsistent indenting
drivers/md/raid5.c:2841 raid5_end_write_request() error: uninitialized symb=
ol 'rdev'.
drivers/md/raid5.c:2846 raid5_end_write_request() error: uninitialized symb=
ol 'rdev'.
drivers/md/raid5.c:6989 alloc_thread_groups() warn: double check that we're=
 allocating correct size: 148 vs 1
drivers/md/raid5.c:8311 raid5_start_reshape() warn: statement has no effect=
 31

vim +264 arch/x86/kvm/../../../virt/kvm/eventfd.c

721eecbf4fe995 Gregory Haskins    2009-05-20  246  =

bd2b53b20fcd0d Michael S. Tsirkin 2010-11-18  247  /* Must be called under =
irqfds.lock */
166c9775f1f8b8 Eric Auger         2015-09-18  248  static void irqfd_update=
(struct kvm *kvm, struct kvm_kernel_irqfd *irqfd)
bd2b53b20fcd0d Michael S. Tsirkin 2010-11-18  249  {
bd2b53b20fcd0d Michael S. Tsirkin 2010-11-18  250  	struct kvm_kernel_irq_r=
outing_entry *e;
8ba918d488cade Paul Mackerras     2014-06-30  251  	struct kvm_kernel_irq_r=
outing_entry entries[KVM_NR_IRQCHIPS];
351dc6477cd351 Andrey Smetanin    2015-10-16  252  	int n_entries;
8ba918d488cade Paul Mackerras     2014-06-30  253  =

9957c86d659a4d Paul Mackerras     2014-06-30  254  	n_entries =3D kvm_irq_m=
ap_gsi(kvm, entries, irqfd->gsi);
bd2b53b20fcd0d Michael S. Tsirkin 2010-11-18  255  =

56f89f3629ffd1 Paul Mackerras     2014-06-30  256  	write_seqcount_begin(&i=
rqfd->irq_entry_sc);
56f89f3629ffd1 Paul Mackerras     2014-06-30  257  =

8ba918d488cade Paul Mackerras     2014-06-30  258  	e =3D entries;
351dc6477cd351 Andrey Smetanin    2015-10-16  259  	if (n_entries =3D=3D 1)
56f89f3629ffd1 Paul Mackerras     2014-06-30  260  		irqfd->irq_entry =3D *=
e;
351dc6477cd351 Andrey Smetanin    2015-10-16  261  	else
351dc6477cd351 Andrey Smetanin    2015-10-16  262  		irqfd->irq_entry.type =
=3D 0;
56f89f3629ffd1 Paul Mackerras     2014-06-30  263  =

56f89f3629ffd1 Paul Mackerras     2014-06-30 @264  	write_seqcount_end(&irq=
fd->irq_entry_sc);
bd2b53b20fcd0d Michael S. Tsirkin 2010-11-18  265  }
bd2b53b20fcd0d Michael S. Tsirkin 2010-11-18  266  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1564024305621436499==--

