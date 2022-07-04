Content-Type: multipart/mixed; boundary="===============0308058619431462017=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6818/7943] kernel/kexec_core.c:827:25: warning: use of NULL 'kbuf' where non-null expected [CWE-476]
Date: Mon, 04 Jul 2022 18:51:33 +0800
Message-ID: <202207041805.1C2cmqWt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0308058619431462017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/kexec_core.c:827:25: warning: use of NULL 'kbuf' where non-null exp=
ected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b6f1f2fa2bddd69ff46a190b8120bd440fd50563
commit: b03fc1173c0c2bb8fad61902a862985cecdc4b1b [6818/7943] bitops: let op=
timize out non-atomic bitops on compile-time constants
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220703 (https://download.01.org/0day-ci/archi=
ve/20220704/202207041805.1C2cmqWt-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db03fc1173c0c2bb8fad61902a862985cecdc4b1b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   kernel/kexec_core.c: In function 'kimage_load_normal_segment':
>> kernel/kexec_core.c:827:25: warning: use of NULL 'kbuf' where non-null e=
xpected [CWE-476] [-Wanalyzer-null-argument]
     827 |                         memcpy(ptr, kbuf, uchunk);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
     'kimage_load_segment': events 1-4
       |
       |  917 | int kimage_load_segment(struct kimage *image,
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'kimage_load_segment'
       |......
       |  922 |         switch (image->type) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'false' branch...
       |  923 |         case KEXEC_TYPE_DEFAULT:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |  924 |                 result =3D kimage_load_normal_segment(image=
, segment);
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |                          |
       |      |                          (4) calling 'kimage_load_normal_se=
gment' from 'kimage_load_segment'
       |
       +--> 'kimage_load_normal_segment': events 5-8
              |
              |  567 |         result =3D kimage_add_entry(image, destinati=
on | IND_DESTINATION);
              |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |      |                  |
              |      |                  (8) calling 'kimage_add_entry' from=
 'kimage_load_normal_segment'
              |......
              |  781 | static int kimage_load_normal_segment(struct kimage =
*image,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'kimage_load_normal_segment'
              |......
              |  790 |         if (image->file_mode)
              |      |            ~
              |      |            |
              |      |            (6) following 'false' branch...
              |......
              |  793 |                 buf =3D segment->buf;
              |      |                 ~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (7) ...to here
              |
              +--> 'kimage_add_entry': events 9-11
                     |
                     |  535 | static int kimage_add_entry(struct kimage *im=
age, kimage_entry_t entry)
                     |      |            ^~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'kimage_add_entry'
                     |......
                     |  540 |         if (image->entry =3D=3D image->last_e=
ntry) {
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'false' branch...
                     |......
                     |  554 |         *image->entry =3D entry;
                     |      |          ~~~~~~~~~~~~
                     |      |               |
                     |      |               (11) ...to here
                     |
              <------+
              |
            'kimage_load_normal_segment': events 12-13
              |
              |  567 |         result =3D kimage_add_entry(image, destinati=
on | IND_DESTINATION);
              |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |      |                  |
              |      |                  (12) returning to 'kimage_load_norm=
al_segment' from 'kimage_add_entry'
              |......
              |  799 |         if (result < 0)
              |      |            ~      =

              |      |            |
              |      |            (13) following 'false' branch (when 'resu=
lt >=3D 0')...
              |
            'kimage_load_normal_segment': event 14
              |
              |cc1:
              | (14): ...to here
              |
            'kimage_load_normal_segment': events 15-17
              |
              |  802 |         while (mbytes) {
              |      |                ^~~~~~
              |      |                |
              |      |                (15) following 'true' branch (when 'm=
bytes !=3D 0')...
              |......
              |  807 |                 page =3D kimage_alloc_page(image, GF=
P_HIGHUSER, maddr);
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (16) ...to here
              |      |                        (17) calling 'kimage_alloc_pa=
ge' from 'kimage_load_normal_segment'
              |
              +--> 'kimage_alloc_page': event 18
                     |
                     |  685 | static struct page *kimage_alloc_page(struct =
kimage *image,
                     |      |                     ^~~~~~~~~~~~~~~~~
                     |      |                     |
                     |      |                     (18) entry to 'kimage_all=
oc_page'
                     |

vim +/kbuf +827 kernel/kexec_core.c

2965faa5e03d1e Dave Young        2015-09-09  780  =

2965faa5e03d1e Dave Young        2015-09-09  781  static int kimage_load_no=
rmal_segment(struct kimage *image,
2965faa5e03d1e Dave Young        2015-09-09  782  					 struct kexec_segmen=
t *segment)
2965faa5e03d1e Dave Young        2015-09-09  783  {
2965faa5e03d1e Dave Young        2015-09-09  784  	unsigned long maddr;
2965faa5e03d1e Dave Young        2015-09-09  785  	size_t ubytes, mbytes;
2965faa5e03d1e Dave Young        2015-09-09  786  	int result;
2965faa5e03d1e Dave Young        2015-09-09  787  	unsigned char __user *bu=
f =3D NULL;
2965faa5e03d1e Dave Young        2015-09-09  788  	unsigned char *kbuf =3D =
NULL;
2965faa5e03d1e Dave Young        2015-09-09  789  =

2965faa5e03d1e Dave Young        2015-09-09  790  	if (image->file_mode)
2965faa5e03d1e Dave Young        2015-09-09  791  		kbuf =3D segment->kbuf;
2965faa5e03d1e Dave Young        2015-09-09  792  	else
2965faa5e03d1e Dave Young        2015-09-09  793  		buf =3D segment->buf;
2965faa5e03d1e Dave Young        2015-09-09  794  	ubytes =3D segment->bufs=
z;
2965faa5e03d1e Dave Young        2015-09-09  795  	mbytes =3D segment->mems=
z;
2965faa5e03d1e Dave Young        2015-09-09  796  	maddr =3D segment->mem;
2965faa5e03d1e Dave Young        2015-09-09  797  =

2965faa5e03d1e Dave Young        2015-09-09  798  	result =3D kimage_set_de=
stination(image, maddr);
2965faa5e03d1e Dave Young        2015-09-09  799  	if (result < 0)
2965faa5e03d1e Dave Young        2015-09-09  800  		goto out;
2965faa5e03d1e Dave Young        2015-09-09  801  =

2965faa5e03d1e Dave Young        2015-09-09  802  	while (mbytes) {
2965faa5e03d1e Dave Young        2015-09-09  803  		struct page *page;
2965faa5e03d1e Dave Young        2015-09-09  804  		char *ptr;
2965faa5e03d1e Dave Young        2015-09-09  805  		size_t uchunk, mchunk;
2965faa5e03d1e Dave Young        2015-09-09  806  =

2965faa5e03d1e Dave Young        2015-09-09  807  		page =3D kimage_alloc_p=
age(image, GFP_HIGHUSER, maddr);
2965faa5e03d1e Dave Young        2015-09-09  808  		if (!page) {
2965faa5e03d1e Dave Young        2015-09-09  809  			result  =3D -ENOMEM;
2965faa5e03d1e Dave Young        2015-09-09  810  			goto out;
2965faa5e03d1e Dave Young        2015-09-09  811  		}
43546d8669d62d Russell King      2016-08-02  812  		result =3D kimage_add_p=
age(image, page_to_boot_pfn(page)
2965faa5e03d1e Dave Young        2015-09-09  813  								<< PAGE_SHIFT);
2965faa5e03d1e Dave Young        2015-09-09  814  		if (result < 0)
2965faa5e03d1e Dave Young        2015-09-09  815  			goto out;
2965faa5e03d1e Dave Young        2015-09-09  816  =

2965faa5e03d1e Dave Young        2015-09-09  817  		ptr =3D kmap(page);
2965faa5e03d1e Dave Young        2015-09-09  818  		/* Start with a clear p=
age */
2965faa5e03d1e Dave Young        2015-09-09  819  		clear_page(ptr);
2965faa5e03d1e Dave Young        2015-09-09  820  		ptr +=3D maddr & ~PAGE_=
MASK;
2965faa5e03d1e Dave Young        2015-09-09  821  		mchunk =3D min_t(size_t=
, mbytes,
2965faa5e03d1e Dave Young        2015-09-09  822  				PAGE_SIZE - (maddr & =
~PAGE_MASK));
2965faa5e03d1e Dave Young        2015-09-09  823  		uchunk =3D min(ubytes, =
mchunk);
2965faa5e03d1e Dave Young        2015-09-09  824  =

2965faa5e03d1e Dave Young        2015-09-09  825  		/* For file based kexec=
, source pages are in kernel memory */
2965faa5e03d1e Dave Young        2015-09-09  826  		if (image->file_mode)
2965faa5e03d1e Dave Young        2015-09-09 @827  			memcpy(ptr, kbuf, uchu=
nk);
2965faa5e03d1e Dave Young        2015-09-09  828  		else
2965faa5e03d1e Dave Young        2015-09-09  829  			result =3D copy_from_u=
ser(ptr, buf, uchunk);
2965faa5e03d1e Dave Young        2015-09-09  830  		kunmap(page);
2965faa5e03d1e Dave Young        2015-09-09  831  		if (result) {
2965faa5e03d1e Dave Young        2015-09-09  832  			result =3D -EFAULT;
2965faa5e03d1e Dave Young        2015-09-09  833  			goto out;
2965faa5e03d1e Dave Young        2015-09-09  834  		}
2965faa5e03d1e Dave Young        2015-09-09  835  		ubytes -=3D uchunk;
2965faa5e03d1e Dave Young        2015-09-09  836  		maddr  +=3D mchunk;
2965faa5e03d1e Dave Young        2015-09-09  837  		if (image->file_mode)
2965faa5e03d1e Dave Young        2015-09-09  838  			kbuf +=3D mchunk;
2965faa5e03d1e Dave Young        2015-09-09  839  		else
2965faa5e03d1e Dave Young        2015-09-09  840  			buf +=3D mchunk;
2965faa5e03d1e Dave Young        2015-09-09  841  		mbytes -=3D mchunk;
a8311f647e4196 Jarrett Farnitano 2018-06-14  842  =

a8311f647e4196 Jarrett Farnitano 2018-06-14  843  		cond_resched();
2965faa5e03d1e Dave Young        2015-09-09  844  	}
2965faa5e03d1e Dave Young        2015-09-09  845  out:
2965faa5e03d1e Dave Young        2015-09-09  846  	return result;
2965faa5e03d1e Dave Young        2015-09-09  847  }
2965faa5e03d1e Dave Young        2015-09-09  848  =


:::::: The code at line 827 was first introduced by commit
:::::: 2965faa5e03d1e71e9ff9aa143fff39e0a77543a kexec: split kexec_load sys=
call from kexec core code

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0308058619431462017==--

