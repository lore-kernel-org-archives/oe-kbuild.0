Content-Type: multipart/mixed; boundary="===============6037644868850892680=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3411/9472] drivers/net/wireless/ath/ath9k/hif_usb.c:251:57: warning: suggest braces around empty body in an 'else' statement
Date: Tue, 12 Jul 2022 16:04:51 +0800
Message-ID: <202207121528.5ZfB3AVz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6037644868850892680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Pavel Skripkin <paskripkin@gmail.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

Hi Pavel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4112a8699ae2eac797415b9be1d7901b3f79e772
commit: d7fc76039b74ad37b7056d5607b05d7cb31a5404 [3411/9472] ath9k: htc: cl=
ean up statistics macros
:::::: branch date: 21 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-r043-20220711 (https://download.01.org/0day-ci/archi=
ve/20220712/202207121528.5ZfB3AVz-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dd7fc76039b74ad37b7056d5607b05d7cb31a5404
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d7fc76039b74ad37b7056d5607b05d7cb31a5404
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darc SHELL=3D/bin/bash drivers/net/wireless/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath9k/hif_usb.c: In function 'ath9k_skb_queue_c=
omplete':
>> drivers/net/wireless/ath/ath9k/hif_usb.c:251:57: warning: suggest braces=
 around empty body in an 'else' statement [-Wempty-body]
     251 |                         TX_STAT_INC(hif_dev, skb_failed);
         |                                                         ^


vim +/else +251 drivers/net/wireless/ath/ath9k/hif_usb.c

b587fc81a80b965 Sujith Manoharan 2011-04-13  233  =

b587fc81a80b965 Sujith Manoharan 2011-04-13  234  static inline void ath9k_=
skb_queue_complete(struct hif_device_usb *hif_dev,
b587fc81a80b965 Sujith Manoharan 2011-04-13  235  					    struct sk_buff_h=
ead *queue,
b587fc81a80b965 Sujith Manoharan 2011-04-13  236  					    bool txok)
b587fc81a80b965 Sujith Manoharan 2011-04-13  237  {
b587fc81a80b965 Sujith Manoharan 2011-04-13  238  	struct sk_buff *skb;
b587fc81a80b965 Sujith Manoharan 2011-04-13  239  =

b587fc81a80b965 Sujith Manoharan 2011-04-13  240  	while ((skb =3D __skb_de=
queue(queue)) !=3D NULL) {
68185a4b37d8790 Ben Greear       2013-06-19  241  #ifdef CONFIG_ATH9K_HTC_D=
EBUGFS
68185a4b37d8790 Ben Greear       2013-06-19  242  		int ln =3D skb->len;
68185a4b37d8790 Ben Greear       2013-06-19  243  #endif
b587fc81a80b965 Sujith Manoharan 2011-04-13  244  		ath9k_htc_txcompletion_=
cb(hif_dev->htc_handle,
b587fc81a80b965 Sujith Manoharan 2011-04-13  245  					  skb, txok);
68185a4b37d8790 Ben Greear       2013-06-19  246  		if (txok) {
d7fc76039b74ad3 Pavel Skripkin   2022-06-13  247  			TX_STAT_INC(hif_dev, s=
kb_success);
d7fc76039b74ad3 Pavel Skripkin   2022-06-13  248  			TX_STAT_ADD(hif_dev, s=
kb_success_bytes, ln);
68185a4b37d8790 Ben Greear       2013-06-19  249  		}
dfa8fc69d92f841 John W. Linville 2011-04-14  250  		else
d7fc76039b74ad3 Pavel Skripkin   2022-06-13 @251  			TX_STAT_INC(hif_dev, s=
kb_failed);
c11d8f89d3b785f Sujith           2010-04-23  252  	}
c11d8f89d3b785f Sujith           2010-04-23  253  }
c11d8f89d3b785f Sujith           2010-04-23  254  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6037644868850892680==--

