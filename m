Content-Type: multipart/mixed; boundary="===============5305581292147613363=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-kiwi-5.10 6824/9999] arch/x86/events/intel/pt.c:475:44: warning: shift by count ('32') >= precision of type ('32')
Date: Sat, 09 Jul 2022 03:48:53 +0800
Message-ID: <202207090313.a7NETolk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5305581292147613363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/x86/events/intel/pt.c:475:44: warning: shift by count ('32') >=3D pre=
cision of type ('32') [-Wanalyzer-shift-count-overflow]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-kiwi-5.10
head:   edf4da79d443f97049926ace891b5d6d235f7539
commit: c108d79a122aa94d1c5fe6305be8c4fec4b64ec5 [6824/9999] UPSTREAM: ubsa=
n: disable object-size sanitizer under GCC
:::::: branch date: 3 months ago
:::::: commit date: 9 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
709/202207090313.a7NETolk-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/c108d79a122aa94=
d1c5fe6305be8c4fec4b64ec5
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android12-kiwi-5.10
        git checkout c108d79a122aa94d1c5fe6305be8c4fec4b64ec5
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   arch/x86/events/intel/pt.c: In function 'pt_config_filters':
>> arch/x86/events/intel/pt.c:475:44: warning: shift by count ('32') >=3D p=
recision of type ('32') [-Wanalyzer-shift-count-overflow]
     475 |                 rtit_ctl |=3D filter->config << pt_address_range=
s[range].reg_off;
         |                                            ^~
     'pt_event_add.part.0': events 1-2
       |
       | 1634 | static int pt_event_add(struct perf_event *event, int mode)
       |      |            ^~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pt_event_add.part.0'
       |......
       | 1644 |                 pt_event_start(event, 0);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) calling 'pt_event_start' from 'pt_event=
_add.part.0'
       |
       +--> 'pt_event_start': events 3-6
              |
              | 1513 | static void pt_event_start(struct perf_event *event,=
 int mode)
              |      |             ^~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'pt_event_start'
              |......
              | 1520 |         if (!buf)
              |      |            ~ =

              |      |            |
              |      |            (4) following 'false' branch (when 'buf' =
is non-NULL)...
              |......
              | 1523 |         pt_buffer_reset_offsets(buf, pt->handle.head=
);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (5) ...to here
              |......
              | 1533 |         pt_config(event);
              |      |         ~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) calling 'pt_config' from 'pt_event_start'
              |
              +--> 'pt_config': events 7-8
                     |
                     |  481 | static void pt_config(struct perf_event *even=
t)
                     |      |             ^~~~~~~~~
                     |      |             |
                     |      |             (7) entry to 'pt_config'
                     |......
                     |  493 |         reg =3D pt_config_filters(event);
                     |      |               ~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |               |
                     |      |               (8) calling 'pt_config_filters'=
 from 'pt_config'
                     |
                     +--> 'pt_config_filters': events 9-16
                            |
                            |  440 | static u64 pt_config_filters(struct pe=
rf_event *event)
                            |      |            ^~~~~~~~~~~~~~~~~
                            |      |            |
                            |      |            (9) entry to 'pt_config_fil=
ters'
                            |......
                            |  447 |         if (!filters)
                            |      |            ~
                            |      |            |
                            |      |            (10) following 'false' bran=
ch (when 'filters' is non-NULL)...
                            |......
                            |  450 |         perf_event_addr_filters_sync(e=
vent);
                            |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |         |
                            |      |         (11) ...to here
                            |  451 | =

                            |  452 |         for (range =3D 0; range < filt=
ers->nr_filters; range++) {
                            |      |                         ~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
                            |      |                               |
                            |      |                               (12) fol=
lowing 'true' branch...
                            |  453 |                 struct pt_filter *filt=
er =3D &filters->filter[range];
                            |      |                 ~~~~~~
                            |      |                 |
                            |      |                 (13) ...to here
                            |......
                            |  475 |                 rtit_ctl |=3D filter->=
config << pt_address_ranges[range].reg_off;
                            |      |                             ~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                                       =
     |                   |
                            |      |                                       =
     |                   (15) ...to here
                            |      |                                       =
     (14) following 'true' branch...
                            |      |                                       =
     (16) shift by count '32' here
                            |

vim +475 arch/x86/events/intel/pt.c

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  439  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  440  static u64 pt_config_fi=
lters(struct perf_event *event)
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  441  {
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  442  	struct pt_filters *fil=
ters =3D event->hw.addr_filters;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  443  	struct pt *pt =3D this=
_cpu_ptr(&pt_ctx);
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  444  	unsigned int range =3D=
 0;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  445  	u64 rtit_ctl =3D 0;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  446  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  447  	if (!filters)
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  448  		return 0;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  449  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  450  	perf_event_addr_filter=
s_sync(event);
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  451  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  452  	for (range =3D 0; rang=
e < filters->nr_filters; range++) {
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  453  		struct pt_filter *fil=
ter =3D &filters->filter[range];
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  454  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  455  		/*
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  456  		 * Note, if the range=
 has zero start/end addresses due
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  457  		 * to its dynamic obj=
ect not being loaded yet, we just
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  458  		 * go ahead and progr=
am zeroed range, which will simply
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  459  		 * produce no data. N=
ote^2: if executable code at 0x0
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  460  		 * is a concern, we c=
an set up an "invalid" configuration
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  461  		 * such as msr_b < ms=
r_a.
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  462  		 */
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  463  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  464  		/* avoid redundant ms=
r writes */
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  465  		if (pt->filters.filte=
r[range].msr_a !=3D filter->msr_a) {
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  466  			wrmsrl(pt_address_ra=
nges[range].msr_a, filter->msr_a);
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  467  			pt->filters.filter[r=
ange].msr_a =3D filter->msr_a;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  468  		}
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  469  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  470  		if (pt->filters.filte=
r[range].msr_b !=3D filter->msr_b) {
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  471  			wrmsrl(pt_address_ra=
nges[range].msr_b, filter->msr_b);
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  472  			pt->filters.filter[r=
ange].msr_b =3D filter->msr_b;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  473  		}
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  474  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27 @475  		rtit_ctl |=3D filter-=
>config << pt_address_ranges[range].reg_off;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  476  	}
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  477  =

eadf48cab4b6b0a Alexander Shishkin 2016-04-27  478  	return rtit_ctl;
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  479  }
eadf48cab4b6b0a Alexander Shishkin 2016-04-27  480  =


:::::: The code@line 475 was first introduced by commit
:::::: eadf48cab4b6b0ab8bcd53feb7d52a71e72debd0 perf/x86/intel/pt: Add supp=
ort for address range filtering in PT

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5305581292147613363==--

