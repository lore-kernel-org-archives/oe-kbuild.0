Content-Type: multipart/mixed; boundary="===============0900267636802521943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC 05/15] fsnotify: Support event submission through ring buffer
Date: Tue, 27 Apr 2021 05:57:49 +0800
Message-ID: <202104270521.I4iomSKx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0900267636802521943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210426184201.4177978-6-krisman@collabora.com>
References: <20210426184201.4177978-6-krisman@collabora.com>
TO: Gabriel Krisman Bertazi <krisman@collabora.com>

Hi Gabriel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on ext4/dev linus/master v5.12]
[cannot apply to ext3/fsnotify next-20210426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gabriel-Krisman-Bertazi/Fi=
le-system-wide-monitoring/20210427-024627
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arc-randconfig-m031-20210426 (attached as .config)
compiler: arceb-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/notify/ring.c:24 fsnotify_ring_peek_first_event() warn: should 'group->r=
ing_buffer.nr_pages << 13' be a 64 bit type?
fs/notify/ring.c:57 fsnotify_ring_buffer_consume_event() warn: should 'grou=
p->ring_buffer.nr_pages << 13' be a 64 bit type?
fs/notify/ring.c:74 fsnotify_ring_alloc_event_slot() warn: should 'group->r=
ing_buffer.nr_pages << 13' be a 64 bit type?
fs/notify/ring.c:139 fsnotify_ring_commit_slot() warn: should 'group->ring_=
buffer.nr_pages << 13' be a 64 bit type?

Old smatch warnings:
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +24 fs/notify/ring.c

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   21  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   22  struct fsnotify_eve=
nt *fsnotify_ring_peek_first_event(struct fsnotify_group *group)
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   23  {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  @24  	u64 ring_size =3D =
group->ring_buffer.nr_pages << PAGE_SHIFT;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   25  	struct fsnotify_ev=
ent *fsn;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   26  	char *kaddr;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   27  	u64 tail;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   28  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   29  	assert_spin_locked=
(&group->notification_lock);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   30  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   31  again:
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   32  	tail =3D group->ri=
ng_buffer.tail;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   33  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   34  	if ((PAGE_SIZE - (=
tail & (PAGE_SIZE-1))) < sizeof(struct fsnotify_event)) {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   35  		group->ring_buffe=
r.tail =3D NEXT_PAGE(tail, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   36  		goto again;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   37  	}
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   38  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   39  	kaddr =3D kmap_ato=
mic(group->ring_buffer.pages[tail / PAGE_SIZE]);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   40  	if (!kaddr)
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   41  		return NULL;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   42  	fsn =3D (struct fs=
notify_event *) (kaddr + (tail & (PAGE_SIZE-1)));
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   43  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   44  	if (fsn->slot_len =
=3D=3D INVALID_RING_SLOT) {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   45  		group->ring_buffe=
r.tail =3D NEXT_PAGE(tail, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   46  		kunmap_atomic(kad=
dr);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   47  		goto again;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   48  	}
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   49  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   50  	/* will be unmappe=
d when entry is consumed. */
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   51  	return fsn;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   52  }
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   53  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   54  void fsnotify_ring_=
buffer_consume_event(struct fsnotify_group *group,
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   55  					struct fsnotif=
y_event *event)
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   56  {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  @57  	u64 ring_size =3D =
group->ring_buffer.nr_pages << PAGE_SHIFT;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   58  	u64 new_tail =3D N=
EXT_SLOT(group->ring_buffer.tail, event->slot_len, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   59  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   60  	kunmap_atomic(even=
t);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   61  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   62  	pr_debug("%s: grou=
p=3D%p tail=3D%llx->%llx ring_size=3D%llu\n", __func__,
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   63  		 group, group->ri=
ng_buffer.tail, new_tail, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   64  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   65  	WRITE_ONCE(group->=
ring_buffer.tail, new_tail);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   66  }
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   67  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   68  struct fsnotify_eve=
nt *fsnotify_ring_alloc_event_slot(struct fsnotify_group *group,
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   69  						      size_t =
size)
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   70  	__acquires(&group-=
>notification_lock)
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   71  {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   72  	struct fsnotify_ev=
ent *fsn;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   73  	u64 head, tail;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  @74  	u64 ring_size =3D =
group->ring_buffer.nr_pages << PAGE_SHIFT;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   75  	u64 new_head;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   76  	void *kaddr;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   77  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   78  	if (WARN_ON(!(grou=
p->flags & FSN_SUBMISSION_RING_BUFFER) || size > PAGE_SIZE))
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   79  		return ERR_PTR(-E=
INVAL);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   80  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   81  	pr_debug("%s: star=
t group=3D%p ring_size=3D%llu, requested=3D%lu\n", __func__, group,
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   82  		 ring_size, size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   83  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   84  	spin_lock(&group->=
notification_lock);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   85  again:
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   86  	head =3D group->ri=
ng_buffer.head;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   87  	tail =3D group->ri=
ng_buffer.tail;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   88  	new_head =3D NEXT_=
SLOT(head, size, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   89  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   90  	/* head would catc=
h up to tail, corrupting an entry. */
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   91  	if ((head < tail &=
& new_head > tail) || (head > new_head && new_head > tail)) {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   92  		fsn =3D ERR_PTR(-=
ENOMEM);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   93  		goto err;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   94  	}
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   95  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   96  	/*
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   97  	 * Not event a ski=
p message fits in the page. We can detect the
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   98  	 * lack of space. =
Move on to the next page.
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26   99  	 */
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  100  	if ((PAGE_SIZE - (=
head & (PAGE_SIZE-1))) < sizeof(struct fsnotify_event)) {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  101  		/* Start again on=
 next page */
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  102  		group->ring_buffe=
r.head =3D NEXT_PAGE(head, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  103  		goto again;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  104  	}
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  105  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  106  	kaddr =3D kmap_ato=
mic(group->ring_buffer.pages[head / PAGE_SIZE]);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  107  	if (!kaddr) {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  108  		fsn =3D ERR_PTR(-=
EFAULT);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  109  		goto err;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  110  	}
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  111  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  112  	fsn =3D (struct fs=
notify_event *) (kaddr + (head & (PAGE_SIZE-1)));
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  113  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  114  	if ((head >> PAGE_=
SHIFT) !=3D (new_head >> PAGE_SHIFT)) {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  115  		/*
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  116  		 * No room in the=
 current page.  Add a fake entry
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  117  		 * consuming the =
end the page to avoid splitting event
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  118  		 * structure.
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  119  		 */
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  120  		fsn->slot_len =3D=
 INVALID_RING_SLOT;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  121  		kunmap_atomic(kad=
dr);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  122  		/* Start again on=
 the next page */
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  123  		group->ring_buffe=
r.head =3D NEXT_PAGE(head, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  124  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  125  		goto again;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  126  	}
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  127  	fsn->slot_len =3D =
size;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  128  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  129  	return fsn;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  130  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  131  err:
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  132  	spin_unlock(&group=
->notification_lock);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  133  	return fsn;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  134  }
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  135  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  136  void fsnotify_ring_=
commit_slot(struct fsnotify_group *group, struct fsnotify_event *fsn)
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  137  	__releases(&group-=
>notification_lock)
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  138  {
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26 @139  	u64 ring_size =3D =
group->ring_buffer.nr_pages << PAGE_SHIFT;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  140  	u64 head =3D group=
->ring_buffer.head;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  141  	u64 new_head =3D N=
EXT_SLOT(head, fsn->slot_len, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  142  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  143  	pr_debug("%s: grou=
p=3D%p head=3D%llx->%llx ring_size=3D%llu\n", __func__,
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  144  		 group, head, new=
_head, ring_size);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  145  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  146  	kunmap_atomic(fsn);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  147  	group->ring_buffer=
.head =3D new_head;
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  148  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  149  	spin_unlock(&group=
->notification_lock);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  150  =

0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  151  	wake_up(&group->no=
tification_waitq);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  152  	kill_fasync(&group=
->fsn_fa, SIGIO, POLL_IN);
0b550d36bb2ec4 Gabriel Krisman Bertazi 2021-04-26  153  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0900267636802521943==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0900267636802521943==--

