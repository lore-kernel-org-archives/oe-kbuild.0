Content-Type: multipart/mixed; boundary="===============8106409999687943072=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [norov:debug_bitmap 7/42] drivers/isdn/mISDN/stack.c:29 _queue_message() error: we previously assumed '&st->status' could be null (see line 29)
Date: Sat, 16 Jul 2022 11:12:02 +0800
Message-ID: <202207161141.rOGKgo1X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8106409999687943072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux debug_bitmap
head:   fcc35ffa2157bb760001976f41d415cc6de3d45c
commit: b03fc1173c0c2bb8fad61902a862985cecdc4b1b [7/42] bitops: let optimiz=
e out non-atomic bitops on compile-time constants
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: microblaze-randconfig-m041-20220716 (https://download.01.org/0day-c=
i/archive/20220716/202207161141.rOGKgo1X-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/isdn/mISDN/stack.c:29 _queue_message() error: we previously assumed=
 '&st->status' could be null (see line 29)

vim +29 drivers/isdn/mISDN/stack.c

1b2b03f8e514e4 Karsten Keil 2008-07-27  19  =

1b2b03f8e514e4 Karsten Keil 2008-07-27  20  static inline void
1b2b03f8e514e4 Karsten Keil 2008-07-27  21  _queue_message(struct mISDNstac=
k *st, struct sk_buff *skb)
1b2b03f8e514e4 Karsten Keil 2008-07-27  22  {
1b2b03f8e514e4 Karsten Keil 2008-07-27  23  	struct mISDNhead	*hh =3D mISDN=
_HEAD_P(skb);
1b2b03f8e514e4 Karsten Keil 2008-07-27  24  =

1b2b03f8e514e4 Karsten Keil 2008-07-27  25  	if (*debug & DEBUG_QUEUE_FUNC)
1b2b03f8e514e4 Karsten Keil 2008-07-27  26  		printk(KERN_DEBUG "%s prim(%x=
) id(%x) %p\n",
1b2b03f8e514e4 Karsten Keil 2008-07-27  27  		       __func__, hh->prim, hh=
->id, skb);
1b2b03f8e514e4 Karsten Keil 2008-07-27  28  	skb_queue_tail(&st->msgq, skb);
1b2b03f8e514e4 Karsten Keil 2008-07-27 @29  	if (likely(!test_bit(mISDN_STA=
CK_STOPPED, &st->status))) {
1b2b03f8e514e4 Karsten Keil 2008-07-27  30  		test_and_set_bit(mISDN_STACK_=
WORK, &st->status);
1b2b03f8e514e4 Karsten Keil 2008-07-27  31  		wake_up_interruptible(&st->wo=
rkq);
1b2b03f8e514e4 Karsten Keil 2008-07-27  32  	}
1b2b03f8e514e4 Karsten Keil 2008-07-27  33  }
1b2b03f8e514e4 Karsten Keil 2008-07-27  34  =


:::::: The code at line 29 was first introduced by commit
:::::: 1b2b03f8e514e4f68e293846ba511a948b80243c Add mISDN core files

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8106409999687943072==--

