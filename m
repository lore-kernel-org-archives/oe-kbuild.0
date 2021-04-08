Content-Type: multipart/mixed; boundary="===============0851583829485288308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [weiny2:tip-pks-v4-5.12-rc 13/23] vgetcpu.c:(.text+0x0): multiple definition of `pkrs_write_current'; arch/x86/entry/vdso/vclock_gettime.o:vclock_gettime.c:(.text+0x0): first defined here
Date: Thu, 08 Apr 2021 09:23:56 +0800
Message-ID: <202104080950.SaLkf5dm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0851583829485288308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ira Weiny <ira.weiny@intel.com>

tree:   https://github.com/weiny2/linux-kernel.git tip-pks-v4-5.12-rc
head:   b8f2dcd125fa7a88ac29aabf06ff75ee220feb12
commit: f780e759e9e5e521e2a8f60ef83615e8bb6c4676 [13/23] WIP: x86/pks: over=
ride invalid PKeys
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-allnoconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:58,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from init/main.c:17:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   init/main.c:764:20: warning: no previous prototype for 'arch_post_acpi_s=
ubsys_init' [-Wmissing-prototypes]
     764 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:776:20: warning: no previous prototype for 'mem_encrypt_init=
' [-Wmissing-prototypes]
     776 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:58,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/kernel/process.c:6:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/process.c:845:13: warning: no previous prototype for 'ar=
ch_post_acpi_subsys_init' [-Wmissing-prototypes]
     845 | void __init arch_post_acpi_subsys_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:58,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/memblock.h:13,
                    from arch/x86/mm/ioremap.c:10:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/mm/ioremap.c:737:17: warning: no previous prototype for 'early_=
memremap_pgprot_adjust' [-Wmissing-prototypes]
     737 | pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phy=
s_addr,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:58,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from arch/x86/mm/extable.c:3:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:27:16: warning: no previous prototype for 'ex_hand=
ler_default' [-Wmissing-prototypes]
      27 | __visible bool ex_handler_default(const struct exception_table_e=
ntry *fixup,
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:37:16: warning: no previous prototype for 'ex_hand=
ler_fault' [-Wmissing-prototypes]
      37 | __visible bool ex_handler_fault(const struct exception_table_ent=
ry *fixup,
         |                ^~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:58:16: warning: no previous prototype for 'ex_hand=
ler_fprestore' [-Wmissing-prototypes]
      58 | __visible bool ex_handler_fprestore(const struct exception_table=
_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:73:16: warning: no previous prototype for 'ex_hand=
ler_uaccess' [-Wmissing-prototypes]
      73 | __visible bool ex_handler_uaccess(const struct exception_table_e=
ntry *fixup,
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:84:16: warning: no previous prototype for 'ex_hand=
ler_copy' [-Wmissing-prototypes]
      84 | __visible bool ex_handler_copy(const struct exception_table_entr=
y *fixup,
         |                ^~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:96:16: warning: no previous prototype for 'ex_hand=
ler_rdmsr_unsafe' [-Wmissing-prototypes]
      96 | __visible bool ex_handler_rdmsr_unsafe(const struct exception_ta=
ble_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:113:16: warning: no previous prototype for 'ex_han=
dler_wrmsr_unsafe' [-Wmissing-prototypes]
     113 | __visible bool ex_handler_wrmsr_unsafe(const struct exception_ta=
ble_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:129:16: warning: no previous prototype for 'ex_han=
dler_clear_fs' [-Wmissing-prototypes]
     129 | __visible bool ex_handler_clear_fs(const struct exception_table_=
entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:58,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/entry/vdso/vma.c:7:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/entry/vdso/vma.c:35:19: warning: no previous prototype for 'arc=
h_get_vdso_data' [-Wmissing-prototypes]
      35 | struct vdso_data *arch_get_vdso_data(void *vvar_page)
         |                   ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/x86/entry/vdso/vgetcpu.c:10:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/entry/vdso/vgetcpu.c:14:1: warning: no previous prototype for '=
__vdso_getcpu' [-Wmissing-prototypes]
      14 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache=
 *unused)
         | ^~~~~~~~~~~~~
--
   ld: arch/x86/entry/vdso/vgetcpu.o: in function `pkrs_write_current':
>> vgetcpu.c:(.text+0x0): multiple definition of `pkrs_write_current'; arch=
/x86/entry/vdso/vclock_gettime.o:vclock_gettime.c:(.text+0x0): first define=
d here
>> objdump: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file
--
>> objcopy: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file
--
   In file included from include/linux/mutex.h:19,
                    from include/linux/seq_file.h:8,
                    from arch/x86/mm/pat/memtype.c:34:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/mm/pat/memtype.c:803:5: warning: no previous prototype for 'arc=
h_io_reserve_memtype_wc' [-Wmissing-prototypes]
     803 | int arch_io_reserve_memtype_wc(resource_size_t start, resource_s=
ize_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/pat/memtype.c:811:6: warning: no previous prototype for 'arc=
h_io_free_memtype_wc' [-Wmissing-prototypes]
     811 | void arch_io_free_memtype_wc(resource_size_t start, resource_siz=
e_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:58,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from kernel/panic.c:14:
>> arch/x86/include/asm/processor.h:806:6: warning: no previous prototype f=
or 'pkrs_write_current' [-Wmissing-prototypes]
     806 | void pkrs_write_current(void) { }
         |      ^~~~~~~~~~~~~~~~~~
   kernel/panic.c:85:13: warning: no previous prototype for 'panic_smp_self=
_stop' [-Wmissing-prototypes]
      85 | void __weak panic_smp_self_stop(void)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/panic.c:95:13: warning: no previous prototype for 'nmi_panic_self=
_stop' [-Wmissing-prototypes]
      95 | void __weak nmi_panic_self_stop(struct pt_regs *regs)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/panic.c:106:13: warning: no previous prototype for 'crash_smp_sen=
d_stop' [-Wmissing-prototypes]
     106 | void __weak crash_smp_send_stop(void)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/panic.c:576:6: warning: no previous prototype for '__warn' [-Wmis=
sing-prototypes]
     576 | void __warn(const char *file, int line, void *caller, unsigned t=
aint,
         |      ^~~~~~
   kernel/panic.c: In function '__warn':
   kernel/panic.c:590:3: warning: function '__warn' might be a candidate fo=
r 'gnu_printf' format attribute [-Wsuggest-attribute=3Dformat]
     590 |   vprintk(args->fmt, args->args);
         |   ^~~~~~~
   kernel/panic.c: At top level:
   kernel/panic.c:640:6: warning: no previous prototype for '__warn_printk'=
 [-Wmissing-prototypes]
     640 | void __warn_printk(const char *fmt, ...)
         |      ^~~~~~~~~~~~~
   kernel/panic.c: In function '__warn_printk':
   kernel/panic.c:647:2: warning: function '__warn_printk' might be a candi=
date for 'gnu_printf' format attribute [-Wsuggest-attribute=3Dformat]
     647 |  vprintk(fmt, args);
         |  ^~~~~~~
..

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0851583829485288308==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0851583829485288308==--

