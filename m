Content-Type: multipart/mixed; boundary="===============7157253233798093558=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/2] kernfs: Convert to u64 id
Date: Tue, 05 Nov 2019 11:54:02 +0300
Message-ID: <20191105085402.GH21796@kadam>
In-Reply-To: <20191104084520.398584-2-namhyung@kernel.org>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7157253233798093558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Namhyung,

url:    https://github.com/0day-ci/linux/commits/Namhyung-Kim/cgroup-Sync-c=
group-id-and-inode-number/20191104-165256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git 9927c6fa3e1d941c9b89f807f5d0480390eb0471

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/blktrace.c:104 trace_note() warn: potential pointer math issue=
 ('t' is a 384 bit pointer)

# https://github.com/0day-ci/linux/commit/a2dbd125b386ea824c182d058d78ddb62=
7bb633c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout a2dbd125b386ea824c182d058d78ddb627bb633c
vim +104 kernel/trace/blktrace.c

a863055b1066be block/blktrace.c        Jens Axboe               2006-12-04 =
  66  static void trace_note(struct blk_trace *bt, pid_t pid, int action,
a2dbd125b386ea kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
  67  		       const void *data, size_t len, u64 cgid)
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
  68  {
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
  69  	struct blk_io_trace *t;
                                                                           =
                                  ^

18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  70  	struct ring_buffer_event *event =3D NULL;
e77405ad80f539 kernel/trace/blktrace.c Steven Rostedt           2009-09-02 =
  71  	struct ring_buffer *buffer =3D NULL;
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  72  	int pc =3D 0;
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  73  	int cpu =3D smp_processor_id();
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  74  	bool blk_tracer =3D blk_tracer_enabled;
a2dbd125b386ea kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
  75  	ssize_t cgid_len =3D cgid ? sizeof(cgid) : 0;
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  76  =

18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  77  	if (blk_tracer) {
12883efb670c28 kernel/trace/blktrace.c Steven Rostedt (Red Hat  2013-03-05 =
  78) 		buffer =3D blk_tr->trace_buffer.buffer;
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  79  		pc =3D preempt_count();
e77405ad80f539 kernel/trace/blktrace.c Steven Rostedt           2009-09-02 =
  80  		event =3D trace_buffer_lock_reserve(buffer, TRACE_BLK,
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
  81  						  sizeof(*t) + len + cgid_len,
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  82  						  0, pc);
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  83  		if (!event)
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  84  			return;
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  85  		t =3D ring_buffer_event_data(event);
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  86  		goto record_it;
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  87  	}
be1c63411addba block/blktrace.c        Olaf Kirch               2006-12-01 =
  88  =

c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
  89  	if (!bt->rchan)
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
  90  		return;
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
  91  =

ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
  92  	t =3D relay_reserve(bt->rchan, sizeof(*t) + len + cgid_len);
d3d9d2a5ea9770 block/blktrace.c        Jens Axboe               2006-12-04 =
  93  	if (t) {
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
  94  		t->magic =3D BLK_IO_TRACE_MAGIC | BLK_IO_TRACE_VERSION;
2997c8c4a0b179 block/blktrace.c        Ingo Molnar              2008-01-11 =
  95  		t->time =3D ktime_to_ns(ktime_get());
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
  96  record_it:
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
  97  		t->device =3D bt->dev;
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
  98  		t->action =3D action | (cgid ? __BLK_TN_CGROUP : 0);
be1c63411addba block/blktrace.c        Olaf Kirch               2006-12-01 =
  99  		t->pid =3D pid;
be1c63411addba block/blktrace.c        Olaf Kirch               2006-12-01 =
 100  		t->cpu =3D cpu;
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 101  		t->pdu_len =3D len + cgid_len;
a2dbd125b386ea kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
 102  		if (cgid_len)
a2dbd125b386ea kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
 103  			*(u64 *)(t + 1) =3D cgid;
a2dbd125b386ea kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
@104  		memcpy((void *)( t + sizeof(*t)) + cgid_len, data, len);
                                                                           =
                                      ^
This will corrupt memory.  It should be:

	memcpy((void *)t + sizeof(*t) + cgid_len, data, len);

Or
	memcpy((void *)(t + 1) + cgid_len, data, len);

I don't know why zero day bot is complaining to you instead of Tejun or
Jens...

18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
 105  =

18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
 106  		if (blk_tracer)
b7f0c959edfb44 kernel/trace/blktrace.c Steven Rostedt (Red Hat  2015-09-25 =
 107) 			trace_buffer_unlock_commit(blk_tr, buffer, event, 0, pc);
d3d9d2a5ea9770 block/blktrace.c        Jens Axboe               2006-12-04 =
 108  	}
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 109  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============7157253233798093558==--

