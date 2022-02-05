Content-Type: multipart/mixed; boundary="===============8668284956946648184=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [RFC 5/5] drm/hdmi21: Add frl_dfm_helper to Makefile
Date: Sat, 05 Feb 2022 11:49:49 +0800
Message-ID: <202202051145.ukwOlIU6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8668284956946648184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220203055012.14568-6-vandita.kulkarni@intel.com>
References: <20220203055012.14568-6-vandita.kulkarni@intel.com>
TO: Vandita Kulkarni <vandita.kulkarni@intel.com>

Hi Vandita,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-tip/drm-tip next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vandita-Kulkarni/Add-data-=
flow-metering-support-for-HDMI2-1/20220203-214922
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
205/202202051145.ukwOlIU6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4c=
e6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d6f76f7f3bc7b26c1dd6ebc11=
ef0cff7deb82058
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vandita-Kulkarni/Add-data-flow-met=
ering-support-for-HDMI2-1/20220203-214922
        git checkout d6f76f7f3bc7b26c1dd6ebc11ef0cff7deb82058
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   sound/isa/sb/sb16_csp.c:365:9: note: Returning from 'copy_from_user'
                                   if (copy_from_user(&code_h, data_ptr, si=
zeof(code_h)))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/isa/sb/sb16_csp.c:365:9: note: Assuming the condition is false
                                   if (copy_from_user(&code_h, data_ptr, si=
zeof(code_h)))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/isa/sb/sb16_csp.c:365:5: note: Taking false branch
                                   if (copy_from_user(&code_h, data_ptr, si=
zeof(code_h)))
                                   ^
   sound/isa/sb/sb16_csp.c:369:9: note: Assuming the condition is true
                                   if (le32_to_cpu(code_h.name) !=3D INIT_H=
EADER)
                                       ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   sound/isa/sb/sb16_csp.c:369:5: note: Taking true branch
                                   if (le32_to_cpu(code_h.name) !=3D INIT_H=
EADER)
                                   ^
   sound/isa/sb/sb16_csp.c:370:6: note:  Execution continues on line 379
                                           break;
                                           ^
   sound/isa/sb/sb16_csp.c:379:8: note: Calling 'copy_from_user'
                           if (copy_from_user(&code_h, data_ptr, sizeof(cod=
e_h)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is false
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   sound/isa/sb/sb16_csp.c:379:8: note: Returning from 'copy_from_user'
                           if (copy_from_user(&code_h, data_ptr, sizeof(cod=
e_h)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/isa/sb/sb16_csp.c:379:8: note: Assuming the condition is false
                           if (copy_from_user(&code_h, data_ptr, sizeof(cod=
e_h)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/isa/sb/sb16_csp.c:379:4: note: Taking false branch
                           if (copy_from_user(&code_h, data_ptr, sizeof(cod=
e_h)))
                           ^
   sound/isa/sb/sb16_csp.c:382:8: note: Assuming the condition is false
                           if (le32_to_cpu(code_h.name) !=3D MAIN_HEADER) {
                               ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   sound/isa/sb/sb16_csp.c:382:4: note: Taking false branch
                           if (le32_to_cpu(code_h.name) !=3D MAIN_HEADER) {
                           ^
   sound/isa/sb/sb16_csp.c:387:10: note: Calling 'snd_sb_csp_load_user'
                           err =3D snd_sb_csp_load_user(p, data_ptr,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/sb/sb16_csp.c:681:6: note: Calling 'IS_ERR'
           if (IS_ERR(kbuf))
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/sb/sb16_csp.c:681:6: note: Returning from 'IS_ERR'
           if (IS_ERR(kbuf))
               ^~~~~~~~~~~~
   sound/isa/sb/sb16_csp.c:681:2: note: Taking false branch
           if (IS_ERR(kbuf))
           ^
   sound/isa/sb/sb16_csp.c:687:2: note: Returning value (loaded from 'err')=
, which participates in a condition later
           return err;
           ^~~~~~~~~~
   sound/isa/sb/sb16_csp.c:387:10: note: Returning from 'snd_sb_csp_load_us=
er'
                           err =3D snd_sb_csp_load_user(p, data_ptr,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/sb/sb16_csp.c:389:8: note: Assuming 'err' is 0
                           if (err)
                               ^~~
   sound/isa/sb/sb16_csp.c:389:4: note: Taking false branch
                           if (err)
                           ^
   sound/isa/sb/sb16_csp.c:395:12: note: Assigned value is garbage or undef=
ined
                           p->mode =3D le16_to_cpu(funcdesc_h.flags_play_re=
c);
                                   ^
   5 warnings generated.
>> drivers/gpu/drm/drm_frl_dfm_helper.c:496:3: warning: Value stored to 'tb=
orrowed_ns' is never read [clang-analyzer-deadcode.DeadStores]
                   tborrowed_ns =3D 0;
                   ^              ~
   drivers/gpu/drm/drm_frl_dfm_helper.c:496:3: note: Value stored to 'tborr=
owed_ns' is never read
                   tborrowed_ns =3D 0;
                   ^              ~
>> drivers/gpu/drm/drm_frl_dfm_helper.c:760:2: warning: Value stored to 'tb=
lank_ref_ns' is never read [clang-analyzer-deadcode.DeadStores]
           tblank_ref_ns =3D drm_frl_dsc_get_tblank_ref_ns(frl_dfm->params.=
line_time_ns,
           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/gpu/drm/drm_frl_dfm_helper.c:760:2: note: Value stored to 'tblan=
k_ref_ns' is never read
           tblank_ref_ns =3D drm_frl_dsc_get_tblank_ref_ns(frl_dfm->params.=
line_time_ns,
           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>> drivers/gpu/drm/drm_frl_dfm_helper.c:770:2: warning: Value stored to 'tb=
lank_target_ns' is never read [clang-analyzer-deadcode.DeadStores]
           tblank_target_ns =3D frl_dfm->params.line_time_ns - tactive_targ=
et_ns;
           ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/drm_frl_dfm_helper.c:770:2: note: Value stored to 'tblan=
k_target_ns' is never read
           tblank_target_ns =3D frl_dfm->params.line_time_ns - tactive_targ=
et_ns;
           ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   sound/firewire/amdtp-stream.c:1683:41: warning: Division by zero [clang-=
analyzer-core.DivideZero]
                                   sched_irq =3D !((s->packet_index + 1) %
                                                                       ^
   sound/firewire/amdtp-stream.c:1949:6: note: Assuming 'replay_seq' is fal=
se
           if (replay_seq) {
               ^~~~~~~~~~
   sound/firewire/amdtp-stream.c:1949:2: note: Taking false branch
           if (replay_seq) {
           ^
   sound/firewire/amdtp-stream.c:1958:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/firewire/amdtp-stream.c:1959:7: note: Assuming field 'direction' i=
s equal to AMDTP_OUT_STREAM
                   if (s->direction =3D=3D AMDTP_OUT_STREAM) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1959:3: note: Taking true branch
                   if (s->direction =3D=3D AMDTP_OUT_STREAM) {
                   ^
   sound/firewire/amdtp-stream.c:1961:4: note:  Execution continues on line=
 1964
                           break;
                           ^
   sound/firewire/amdtp-stream.c:1964:7: note: 'found' is true
           if (!found)
                ^~~~~
   sound/firewire/amdtp-stream.c:1964:2: note: Taking false branch
           if (!found)
           ^
   sound/firewire/amdtp-stream.c:1973:6: note: Assuming 'events_per_period'=
 is not equal to 0
           if (events_per_period =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1973:2: note: Taking false branch
           if (events_per_period =3D=3D 0)
           ^
   sound/firewire/amdtp-stream.c:1975:6: note: Assuming 'events_per_buffer'=
 is not equal to 0
           if (events_per_buffer =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1975:2: note: Taking false branch
           if (events_per_buffer =3D=3D 0)
           ^
   sound/firewire/amdtp-stream.c:1981:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/firewire/amdtp-stream.c:1984:10: note: Field 'direction' is equal =
to AMDTP_OUT_STREAM
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                          ^
   sound/firewire/amdtp-stream.c:1984:7: note: Left side of '&&' is true
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                       ^
   sound/firewire/amdtp-stream.c:1984:43: note: 's' is equal to field 'irq_=
target'
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                                                           ^
   sound/firewire/amdtp-stream.c:1984:3: note: Taking true branch
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                   ^
   sound/firewire/amdtp-stream.c:1991:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   sound/firewire/amdtp-stream.c:1991:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/firewire/amdtp-stream.c:1981:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/firewire/amdtp-stream.c:1982:3: note: 'idle_irq_interval' initiali=
zed to 0
                   unsigned int idle_irq_interval =3D 0;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1984:7: note: Assuming field 'direction' i=
s not equal to AMDTP_OUT_STREAM
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1984:40: note: Left side of '&&' is false
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                                                        ^
   sound/firewire/amdtp-stream.c:1990:65: note: Passing the value 0 via 5th=
 parameter 'idle_irq_interval'
                   err =3D amdtp_stream_start(s, s->channel, s->speed, queu=
e_size, idle_irq_interval);
                                                                           =
      ^~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1990:9: note: Calling 'amdtp_stream_start'
                   err =3D amdtp_stream_start(s, s->channel, s->speed, queu=
e_size, idle_irq_interval);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1558:14: note: Calling 'amdtp_stream_runni=
ng'
           if (WARN_ON(amdtp_stream_running(s) ||
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~

vim +/tborrowed_ns +496 drivers/gpu/drm/drm_frl_dfm_helper.c

77ec1f8e778dfe Vandita Kulkarni 2022-02-03  467  =

77ec1f8e778dfe Vandita Kulkarni 2022-02-03  468  /* Verify the configuratio=
n meets the capacity requirements for the FRL configuration*/
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  469  static bool
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  470  drm_frl_dfm_verify_frl_cap=
acity_requirement(struct drm_hdmi_frl_dfm *frl_dfm)
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  471  {
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  472  	u32 tactive_ref_ns, tblan=
k_ref_ns, tactive_min_ns, tblank_min_ns;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  473  	u32 tborrowed_ns;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  474  =

77ec1f8e778dfe Vandita Kulkarni 2022-02-03  475  	frl_dfm->params.ftb_avg_k=
 =3D
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  476  			drm_get_avg_tribyte_rat=
e(frl_dfm->params.pixel_clock_max_khz,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  477  						 frl_dfm->params.tb_=
active, frl_dfm->params.tb_blank,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  478  						 frl_dfm->config.hac=
tive, frl_dfm->config.hblank);
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  479  	tactive_ref_ns =3D drm_ge=
t_tactive_ref(frl_dfm->params.line_time_ns,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  480  					     frl_dfm->config.=
hblank,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  481  					     frl_dfm->config.=
hactive);
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  482  	tblank_ref_ns =3D drm_get=
_tblank_ref(frl_dfm->params.line_time_ns,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  483  					   frl_dfm->config.hb=
lank,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  484  					   frl_dfm->config.ha=
ctive);
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  485  	tactive_min_ns =3D drm_ge=
t_tactive_min(frl_dfm->config.lanes,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  486  					     frl_dfm->params.=
tb_active,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  487  					     frl_dfm->params.=
overhead_max,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  488  					     frl_dfm->params.=
char_rate_min_kbps);
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  489  	tblank_min_ns =3D drm_get=
_tblank_min(frl_dfm->config.lanes,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  490  					     frl_dfm->params.=
tb_blank,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  491  					     frl_dfm->params.=
overhead_max,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  492  					     frl_dfm->params.=
char_rate_min_kbps);
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  493  =

77ec1f8e778dfe Vandita Kulkarni 2022-02-03  494  	if ((tactive_ref_ns >=3D =
tactive_min_ns) &&
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  495  	    (tblank_ref_ns >=3D t=
blank_min_ns)) {
77ec1f8e778dfe Vandita Kulkarni 2022-02-03 @496  		tborrowed_ns =3D 0;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  497  		frl_dfm->params.tb_borro=
wed =3D 0;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  498  		return true;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  499  	}
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  500  =

77ec1f8e778dfe Vandita Kulkarni 2022-02-03  501  	if ((tactive_ref_ns < tac=
tive_min_ns) &&
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  502  	    (tblank_ref_ns >=3D t=
blank_min_ns)) {
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  503  		tborrowed_ns =3D tactive=
_min_ns - tactive_ref_ns;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  504  		frl_dfm->params.tb_borro=
wed =3D drm_get_tribytes_borrowed(tborrowed_ns,
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  505  								 frl_dfm->params.f=
tb_avg_k);
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  506  		if (frl_dfm->params.tb_b=
orrowed <=3D TB_BORROWED_MAX)
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  507  			return true;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  508  	}
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  509  =

77ec1f8e778dfe Vandita Kulkarni 2022-02-03  510  	return false;
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  511  }
77ec1f8e778dfe Vandita Kulkarni 2022-02-03  512  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8668284956946648184==--

