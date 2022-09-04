Content-Type: multipart/mixed; boundary="===============0788444373057763434=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 09/13] devdax: Move address_space helpers to the DAX core
Date: Sun, 04 Sep 2022 22:21:30 +0800
Message-ID: <202209042206.k8o25KDa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0788444373057763434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/d=
ax/mapping.c:83:35: warning: Parameter 'entry' can be declared with const [=
constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <166225781235.2351842.9238883139775499926.stgit@dwillia2-xfh=
.jf.intel.com>
References: <166225781235.2351842.9238883139775499926.stgit@dwillia2-xfh.=
jf.intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

Hi Dan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 1c23f9e627a7b412978b4e852793c5e3c3efc555]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/Fix-the=
-DAX-gup-mistake/20220904-101909
base:   1c23f9e627a7b412978b4e852793c5e3c3efc555
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fad43bd381f272faee26ae09d0741c48a4dbaa14
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/dax/mapping.c:83:35: warning: Parameter 'entry' can be declared =
with const [constParameter]
   static bool dax_is_conflict(void *entry)
                                     ^
>> drivers/dax/mapping.c:366:71: warning: Parameter 'mapping' can be declar=
ed with const [constParameter]
   static void dax_disassociate_entry(void *entry, struct address_space *ma=
pping,
                                                                         ^
--
>> mm/swap.c:623:31: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    struct folio_batch *fbatch =3D &fbatches->lru_add;
                                 ^
   mm/swap.c:622:34: note: Address of variable taken here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                    ^
   mm/swap.c:623:31: note: Address of variable taken here.
    struct folio_batch *fbatch =3D &fbatches->lru_add;
                                 ^
   mm/swap.c:622:42: note: Temporary created here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                            ^
   mm/swap.c:623:31: note: Using pointer that is a temporary.
    struct folio_batch *fbatch =3D &fbatches->lru_add;
                                 ^
   mm/swap.c:623:32: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    struct folio_batch *fbatch =3D &fbatches->lru_add;
                                  ^
   mm/swap.c:622:34: note: Address of variable taken here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                    ^
   mm/swap.c:622:42: note: Temporary created here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                            ^
   mm/swap.c:623:32: note: Using pointer that is a temporary.
    struct folio_batch *fbatch =3D &fbatches->lru_add;
                                  ^
   mm/swap.c:625:24: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (folio_batch_count(fbatch))
                          ^
   mm/swap.c:622:34: note: Address of variable taken here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                    ^
   mm/swap.c:623:31: note: Address of variable taken here.
    struct folio_batch *fbatch =3D &fbatches->lru_add;
                                 ^
   mm/swap.c:622:42: note: Temporary created here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                            ^
   mm/swap.c:625:24: note: Using pointer that is a temporary.
    if (folio_batch_count(fbatch))
                          ^
   mm/swap.c:630:34: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (data_race(folio_batch_count(fbatch))) {
                                    ^
   mm/swap.c:628:11: note: Address of variable taken here.
    fbatch =3D &per_cpu(lru_rotate.fbatch, cpu);
             ^
   mm/swap.c:628:19: note: Temporary created here.
    fbatch =3D &per_cpu(lru_rotate.fbatch, cpu);
                     ^
   mm/swap.c:630:34: note: Using pointer that is a temporary.
    if (data_race(folio_batch_count(fbatch))) {
                                    ^
   mm/swap.c:639:11: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    fbatch =3D &fbatches->lru_deactivate_file;
             ^
   mm/swap.c:622:34: note: Address of variable taken here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                    ^
   mm/swap.c:639:11: note: Address of variable taken here.
    fbatch =3D &fbatches->lru_deactivate_file;
             ^
   mm/swap.c:622:42: note: Temporary created here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                            ^
   mm/swap.c:639:11: note: Using pointer that is a temporary.
    fbatch =3D &fbatches->lru_deactivate_file;
             ^
   mm/swap.c:640:24: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (folio_batch_count(fbatch))
                          ^
   mm/swap.c:622:34: note: Address of variable taken here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                    ^
   mm/swap.c:639:11: note: Address of variable taken here.
    fbatch =3D &fbatches->lru_deactivate_file;
             ^
   mm/swap.c:622:42: note: Temporary created here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                            ^
   mm/swap.c:640:24: note: Using pointer that is a temporary.
    if (folio_batch_count(fbatch))
                          ^
   mm/swap.c:643:11: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    fbatch =3D &fbatches->lru_deactivate;
             ^
   mm/swap.c:622:34: note: Address of variable taken here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                    ^
   mm/swap.c:643:11: note: Address of variable taken here.
    fbatch =3D &fbatches->lru_deactivate;
             ^
   mm/swap.c:622:42: note: Temporary created here.
    struct cpu_fbatches *fbatches =3D &per_cpu(cpu_fbatches, cpu);
                                            ^
   mm/swap.c:643:11: note: Using pointer that is a temporary.
    fbatch =3D &fbatches->lru_deactivate;
             ^
   mm/swap.c:644:24: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (folio_batch_count(fbatch))

vim +/entry +83 drivers/dax/mapping.c

fad43bd381f272 Dan Williams 2022-09-03  78  =

fad43bd381f272 Dan Williams 2022-09-03  79  /*
fad43bd381f272 Dan Williams 2022-09-03  80   * true if the entry that was f=
ound is of a smaller order than the entry
fad43bd381f272 Dan Williams 2022-09-03  81   * we were looking for
fad43bd381f272 Dan Williams 2022-09-03  82   */
fad43bd381f272 Dan Williams 2022-09-03 @83  static bool dax_is_conflict(voi=
d *entry)
fad43bd381f272 Dan Williams 2022-09-03  84  {
fad43bd381f272 Dan Williams 2022-09-03  85  	return entry =3D=3D XA_RETRY_E=
NTRY;
fad43bd381f272 Dan Williams 2022-09-03  86  }
fad43bd381f272 Dan Williams 2022-09-03  87  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0788444373057763434==--

