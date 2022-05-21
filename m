Content-Type: multipart/mixed; boundary="===============0890543834468717843=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [paulmck-rcu:context-tracking.2022.05.19a 9/21] readelf: Warning: Unable to load dwo file: kernel/context_tracking.dwo
Date: Sun, 22 May 2022 01:52:22 +0800
Message-ID: <202205220137.sXN9ftyG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0890543834468717843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it context-tracking.2022.05.19a
head:   6153dca9e37b244684bf472728f5c3688c5b0aca
commit: 2cb3fd40e45308a68ac4cc996ee98cb424601f10 [9/21] context_tracking: T=
ake idle eqs entrypoints over RCU
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-s032-20220519 (https://download.01.org/0day-ci/arch=
ive/20220522/202205220137.sXN9ftyG-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git/commit/?id=3D2cb3fd40e45308a68ac4cc996ee98cb424601f10
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/ker=
nel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu context-tracking.2022.05.19a
        git checkout 2cb3fd40e45308a68ac4cc996ee98cb424601f10
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dia64 =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   readelf: Warning: Unable to load dwo file: fs/filesystems.dwo
   readelf: Warning: Unable to load dwo file: fs/file.dwo
   readelf: Warning: Unable to load dwo file: fs/bad_inode.dwo
   readelf: Warning: Unable to load dwo file: fs/attr.dwo
   readelf: Warning: Unable to load dwo file: fs/inode.dwo
   readelf: Warning: Unable to load dwo file: fs/dcache.dwo
   readelf: Warning: Unable to load dwo file: fs/select.dwo
   readelf: Warning: Unable to load dwo file: fs/readdir.dwo
   readelf: Warning: Unable to load dwo file: fs/ioctl.dwo
   readelf: Warning: Unable to load dwo file: fs/fcntl.dwo
   readelf: Warning: Unable to load dwo file: fs/namei.dwo
   readelf: Warning: Unable to load dwo file: fs/pipe.dwo
   readelf: Warning: Unable to load dwo file: fs/exec.dwo
   readelf: Warning: Unable to load dwo file: fs/stat.dwo
   readelf: Warning: Unable to load dwo file: fs/char_dev.dwo
   readelf: Warning: Unable to load dwo file: fs/super.dwo
   readelf: Warning: Unable to load dwo file: fs/file_table.dwo
   readelf: Warning: Unable to load dwo file: fs/read_write.dwo
   readelf: Warning: Unable to load dwo file: fs/open.dwo
   readelf: Warning: Unable to load dwo file: mm/memfd.dwo
   readelf: Warning: Unable to load dwo file: mm/percpu-stats.dwo
   readelf: Warning: Unable to load dwo file: mm/damon/sysfs.dwo
   readelf: Warning: Unable to load dwo file: mm/damon/core.dwo
   readelf: Warning: Unable to load dwo file: mm/userfaultfd.dwo
   readelf: Warning: Unable to load dwo file: mm/page_ext.dwo
   readelf: Warning: Unable to load dwo file: mm/z3fold.dwo
   readelf: Warning: Unable to load dwo file: mm/zsmalloc.dwo
   readelf: Warning: Unable to load dwo file: mm/zpool.dwo
   readelf: Warning: Unable to load dwo file: mm/page_isolation.dwo
   readelf: Warning: Unable to load dwo file: mm/page_owner.dwo
   readelf: Warning: Unable to load dwo file: mm/gup_test.dwo
   readelf: Warning: Unable to load dwo file: mm/hugetlb_cgroup.dwo
   readelf: Warning: Unable to load dwo file: mm/swap_cgroup.dwo
   readelf: Warning: Unable to load dwo file: mm/vmpressure.dwo
   readelf: Warning: Unable to load dwo file: mm/memcontrol.dwo
   readelf: Warning: Unable to load dwo file: mm/page_counter.dwo
   readelf: Warning: Unable to load dwo file: mm/migrate.dwo
   readelf: Warning: Unable to load dwo file: mm/slab.dwo
   readelf: Warning: Unable to load dwo file: mm/page_poison.dwo
   readelf: Warning: Unable to load dwo file: mm/mmu_notifier.dwo
   readelf: Warning: Unable to load dwo file: mm/sparse.dwo
   readelf: Warning: Unable to load dwo file: mm/mempolicy.dwo
   readelf: Warning: Unable to load dwo file: mm/hugetlb.dwo
   readelf: Warning: Unable to load dwo file: mm/dmapool.dwo
   readelf: Warning: Unable to load dwo file: mm/swap_slots.dwo
   readelf: Warning: Unable to load dwo file: mm/swapfile.dwo
   readelf: Warning: Unable to load dwo file: mm/swap_state.dwo
   readelf: Warning: Unable to load dwo file: mm/page_io.dwo
   readelf: Warning: Unable to load dwo file: mm/madvise.dwo
   readelf: Warning: Unable to load dwo file: mm/memory_hotplug.dwo
   readelf: Warning: Unable to load dwo file: mm/memblock.dwo
   readelf: Warning: Unable to load dwo file: mm/init-mm.dwo
   readelf: Warning: Unable to load dwo file: mm/shuffle.dwo
   readelf: Warning: Unable to load dwo file: mm/page_alloc.dwo
   readelf: Warning: Unable to load dwo file: mm/vmalloc.dwo
   readelf: Warning: Unable to load dwo file: mm/rmap.dwo
   readelf: Warning: Unable to load dwo file: mm/pgtable-generic.dwo
   readelf: Warning: Unable to load dwo file: mm/pagewalk.dwo
   readelf: Warning: Unable to load dwo file: mm/page_vma_mapped.dwo
   readelf: Warning: Unable to load dwo file: mm/msync.dwo
   readelf: Warning: Unable to load dwo file: mm/mremap.dwo
   readelf: Warning: Unable to load dwo file: mm/mprotect.dwo
   readelf: Warning: Unable to load dwo file: mm/mmu_gather.dwo
   readelf: Warning: Unable to load dwo file: mm/mmap.dwo
   readelf: Warning: Unable to load dwo file: mm/mlock.dwo
   readelf: Warning: Unable to load dwo file: mm/mincore.dwo
   readelf: Warning: Unable to load dwo file: mm/memory.dwo
   readelf: Warning: Unable to load dwo file: mm/highmem.dwo
   readelf: Warning: Unable to load dwo file: mm/mmap_lock.dwo
   readelf: Warning: Unable to load dwo file: mm/gup.dwo
   readelf: Warning: Unable to load dwo file: mm/debug.dwo
   readelf: Warning: Unable to load dwo file: mm/workingset.dwo
   readelf: Warning: Unable to load dwo file: mm/list_lru.dwo
   readelf: Warning: Unable to load dwo file: mm/interval_tree.dwo
   readelf: Warning: Unable to load dwo file: mm/vmacache.dwo
   readelf: Warning: Unable to load dwo file: mm/compaction.dwo
   readelf: Warning: Unable to load dwo file: mm/slab_common.dwo
   readelf: Warning: Unable to load dwo file: mm/percpu.dwo
   readelf: Warning: Unable to load dwo file: mm/mm_init.dwo
   readelf: Warning: Unable to load dwo file: mm/backing-dev.dwo
   readelf: Warning: Unable to load dwo file: mm/vmstat.dwo
   readelf: Warning: Unable to load dwo file: mm/mmzone.dwo
   readelf: Warning: Unable to load dwo file: mm/util.dwo
   readelf: Warning: Unable to load dwo file: mm/shmem.dwo
   readelf: Warning: Unable to load dwo file: mm/vmscan.dwo
   readelf: Warning: Unable to load dwo file: mm/truncate.dwo
   readelf: Warning: Unable to load dwo file: mm/swap.dwo
   readelf: Warning: Unable to load dwo file: mm/readahead.dwo
   readelf: Warning: Unable to load dwo file: mm/folio-compat.dwo
   readelf: Warning: Unable to load dwo file: mm/page-writeback.dwo
   readelf: Warning: Unable to load dwo file: mm/maccess.dwo
   readelf: Warning: Unable to load dwo file: mm/fadvise.dwo
   readelf: Warning: Unable to load dwo file: mm/oom_kill.dwo
   readelf: Warning: Unable to load dwo file: mm/mempool.dwo
   readelf: Warning: Unable to load dwo file: mm/filemap.dwo
   readelf: Warning: Unable to load dwo file: certs/common.dwo
   readelf: Warning: Unable to load dwo file: certs/system_keyring.dwo
   readelf: Warning: Unable to load dwo file: kernel/watch_queue.dwo
   readelf: Warning: Unable to load dwo file: kernel/iomem.dwo
   readelf: Warning: Unable to load dwo file: kernel/torture.dwo
>> readelf: Warning: Unable to load dwo file: kernel/context_tracking.dwo
   readelf: Warning: Unable to load dwo file: kernel/padata.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/relo_core.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/btf.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/disasm.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/bpf_task_storage.d=
wo
   readelf: Warning: Unable to load dwo file: kernel/bpf/bpf_local_storage.=
dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/ringbuf.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/queue_stack_maps.d=
wo
   readelf: Warning: Unable to load dwo file: kernel/bpf/local_storage.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/bloom_filter.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/map_in_map.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/lpm_trie.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/bpf_lru_list.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/percpu_freelist.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/arraymap.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/hashtab.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/prog_iter.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/task_iter.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/map_iter.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/bpf_iter.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/tnum.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/helpers.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/inode.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/verifier.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/syscall.dwo
   readelf: Warning: Unable to load dwo file: kernel/bpf/core.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq_work.dwo
   readelf: Warning: Unable to load dwo file: kernel/trace/trace_clock.dwo
   readelf: Warning: Unable to load dwo file: kernel/watchdog.dwo
   readelf: Warning: Unable to load dwo file: kernel/kprobes.dwo
   readelf: Warning: Unable to load dwo file: kernel/stop_machine.dwo
   readelf: Warning: Unable to load dwo file: kernel/kheaders.dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/debug.dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/rdma.dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/legacy_freezer.=
dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/freezer.dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/cgroup-v1.dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/namespace.dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/rstat.dwo
   readelf: Warning: Unable to load dwo file: kernel/cgroup/cgroup.dwo
   readelf: Warning: Unable to load dwo file: kernel/kallsyms.dwo
   readelf: Warning: Unable to load dwo file: kernel/module_signature.dwo
   readelf: Warning: Unable to load dwo file: kernel/module_signing.dwo
   readelf: Warning: Unable to load dwo file: kernel/module.dwo
   readelf: Warning: Unable to load dwo file: kernel/smp.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/timekeeping_debug=
.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/tick-legacy.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/itimer.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/posix-clock.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/posix-cpu-timers.=
dwo
   readelf: Warning: Unable to load dwo file: kernel/time/posix-timers.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/alarmtimer.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/timecounter.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/timeconv.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/timer_list.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/jiffies.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/clocksource.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/ntp.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/timekeeping.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/hrtimer.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/timer.dwo
   readelf: Warning: Unable to load dwo file: kernel/time/time.dwo
   readelf: Warning: Unable to load dwo file: kernel/stacktrace.dwo
   readelf: Warning: Unable to load dwo file: kernel/profile.dwo
   readelf: Warning: Unable to load dwo file: kernel/freezer.dwo
   readelf: Warning: Unable to load dwo file: kernel/kcmp.dwo
   readelf: Warning: Unable to load dwo file: kernel/dma/remap.dwo
   readelf: Warning: Unable to load dwo file: kernel/dma/swiotlb.dwo
   readelf: Warning: Unable to load dwo file: kernel/dma/debug.dwo
   readelf: Warning: Unable to load dwo file: kernel/dma/direct.dwo
   readelf: Warning: Unable to load dwo file: kernel/dma/mapping.dwo
   readelf: Warning: Unable to load dwo file: kernel/rcu/rcu_segcblist.dwo
   readelf: Warning: Unable to load dwo file: kernel/rcu/tree.dwo
   readelf: Warning: Unable to load dwo file: kernel/rcu/rcutorture.dwo
   readelf: Warning: Unable to load dwo file: kernel/rcu/srcutree.dwo
   readelf: Warning: Unable to load dwo file: kernel/rcu/sync.dwo
   readelf: Warning: Unable to load dwo file: kernel/rcu/update.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/affinity.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/msi.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/migration.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/irq_sim.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/irqdomain.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/autoprobe.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/devres.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/dummychip.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/chip.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/resend.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/spurious.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/manage.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/handle.dwo
   readelf: Warning: Unable to load dwo file: kernel/irq/irqdesc.dwo
   readelf: Warning: Unable to load dwo file: kernel/printk/printk.dwo
   readelf: Warning: Unable to load dwo file: kernel/power/poweroff.dwo
   readelf: Warning: Unable to load dwo file: kernel/power/process.dwo
   readelf: Warning: Unable to load dwo file: kernel/power/qos.dwo
   readelf: Warning: Unable to load dwo file: kernel/locking/test-ww_mutex.=
dwo
   readelf: Warning: Unable to load dwo file: kernel/locking/spinlock_debug=
.dwo
   readelf: Warning: Unable to load dwo file: kernel/locking/rtmutex_api.dwo
   readelf: Warning: Unable to load dwo file: kernel/locking/spinlock.dwo
   readelf: Warning: Unable to load dwo file: kernel/locking/mutex-debug.dwo

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0890543834468717843==--

