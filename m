Content-Type: multipart/mixed; boundary="===============4508246649345866054=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10921/14705] fs/file_table.c:373:5-29: atomic_dec_and_test variation before object free at line 388.
Date: Thu, 02 Jun 2022 15:53:53 +0800
Message-ID: <202206021508.JHEmm88C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4508246649345866054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Gou Hao <gouhao@uniontech.com>
CC: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2e776ccffa840ce53ee1c21bde54cbe4bc102c3b
commit: 81132a39c152ca09832b9e4cb748129cee5f55ec [10921/14705] fs: remove f=
get_many and fput_many interface
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220602/202206021508.JHEmm88C-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/file_table.c:373:5-29: atomic_dec_and_test variation before object fr=
ee at line 388.

vim +373 fs/file_table.c

4a9d4b024a3102f Al Viro       2012-06-24  370  =

81132a39c152ca0 Gou Hao       2021-11-02  371  void fput(struct file *file)
d7065da038227a4 Al Viro       2010-05-26  372  {
81132a39c152ca0 Gou Hao       2021-11-02 @373  	if (atomic_long_dec_and_tes=
t(&file->f_count)) {
4a9d4b024a3102f Al Viro       2012-06-24  374  		struct task_struct *task =
=3D current;
e7b2c4069252732 Oleg Nesterov 2013-06-14  375  =

e7b2c4069252732 Oleg Nesterov 2013-06-14  376  		if (likely(!in_interrupt()=
 && !(task->flags & PF_KTHREAD))) {
e7b2c4069252732 Oleg Nesterov 2013-06-14  377  			init_task_work(&file->f_u=
.fu_rcuhead, ____fput);
91989c707884ecc Jens Axboe    2020-10-16  378  			if (!task_work_add(task, =
&file->f_u.fu_rcuhead, TWA_RESUME))
e7b2c4069252732 Oleg Nesterov 2013-06-14  379  				return;
64372501e2af9b1 Andrew Morton 2013-07-08  380  			/*
64372501e2af9b1 Andrew Morton 2013-07-08  381  			 * After this task has ru=
n exit_task_work(),
be49b30a98fe7e2 Andrew Morton 2013-09-11  382  			 * task_work_add() will f=
ail.  Fall through to delayed
64372501e2af9b1 Andrew Morton 2013-07-08  383  			 * fput to avoid leaking =
*file.
64372501e2af9b1 Andrew Morton 2013-07-08  384  			 */
e7b2c4069252732 Oleg Nesterov 2013-06-14  385  		}
4f5e65a1cc90bbb Oleg Nesterov 2013-07-08  386  =

4f5e65a1cc90bbb Oleg Nesterov 2013-07-08  387  		if (llist_add(&file->f_u.f=
u_llist, &delayed_fput_list))
c7314d74fcb089b Al Viro       2013-10-20 @388  			schedule_delayed_work(&de=
layed_fput_work, 1);
4a9d4b024a3102f Al Viro       2012-06-24  389  	}
4a9d4b024a3102f Al Viro       2012-06-24  390  }
4a9d4b024a3102f Al Viro       2012-06-24  391  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4508246649345866054==--

