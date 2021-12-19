Content-Type: multipart/mixed; boundary="===============7102482470333279810=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-sound:for-5.17 8/116] drivers/firmware/cirrus/cs_dsp.c:345:3: warning: Argument to kfree() is the address of the local variable 'buf_list', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Sun, 19 Dec 2021 09:24:38 +0800
Message-ID: <202112190952.1A0rsbRw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7102482470333279810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Rhodes <drhodes@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-5.17
head:   c50384d7e331aceeb4072bf363d5235eddda65bf
commit: bae9e13fc55cbc5ae25409385b2f1ba9187082d0 [8/116] ASoC: cs35l41: DSP=
 Support
:::::: branch date: 32 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20211218 (https://download.01.org/0day-ci/archi=
ve/20211219/202112190952.1A0rsbRw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31=
a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=
/commit/?id=3Dbae9e13fc55cbc5ae25409385b2f1ba9187082d0
        git remote add broonie-sound https://git.kernel.org/pub/scm/linux/k=
ernel/git/broonie/sound.git
        git fetch --no-tags broonie-sound for-5.17
        git checkout bae9e13fc55cbc5ae25409385b2f1ba9187082d0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                      ^~~~
   sound/core/rawmidi.c:1838:17: note: Left side of '&&' is false
           if (rmidi->ops && rmidi->ops->dev_unregister)
                          ^
   sound/core/rawmidi.c:1838:2: note: '?' condition is false
           if (rmidi->ops && rmidi->ops->dev_unregister)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/rawmidi.c:1838:13: note: Field 'ops' is null
           if (rmidi->ops && rmidi->ops->dev_unregister)
                      ^
   sound/core/rawmidi.c:1838:17: note: Left side of '&&' is false
           if (rmidi->ops && rmidi->ops->dev_unregister)
                          ^
   sound/core/rawmidi.c:1838:2: note: '?' condition is false
           if (rmidi->ops && rmidi->ops->dev_unregister)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   sound/core/rawmidi.c:1838:2: note: Taking false branch
           if (rmidi->ops && rmidi->ops->dev_unregister)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/core/rawmidi.c:1842:2: note: Calling 'snd_rawmidi_free_substreams'
           snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM=
_INPUT]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   sound/core/rawmidi.c:1823:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stream->substreams)) {
           ^
   sound/core/rawmidi.c:1826:3: note: Memory is released
                   kfree(substream);
                   ^~~~~~~~~~~~~~~~
   sound/core/rawmidi.c:1823:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stream->substreams)) {
           ^
   sound/core/rawmidi.c:1825:3: note: Calling 'list_del'
                   list_del(&substream->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   sound/core/rawmidi.c:599:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->id, rmidi->id);
           ^~~~~~
   sound/core/rawmidi.c:599:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(info->id, rmidi->id);
           ^~~~~~
   sound/core/rawmidi.c:600:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->name, rmidi->name);
           ^~~~~~
   sound/core/rawmidi.c:600:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(info->name, rmidi->name);
           ^~~~~~
   sound/core/rawmidi.c:601:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->subname, substream->name);
           ^~~~~~
   sound/core/rawmidi.c:601:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(info->subname, substream->name);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/firmware/cirrus/cs_dsp.c:345:3: warning: Argument to kfree() is =
the address of the local variable 'buf_list', which is not memory allocated=
 by malloc() [clang-analyzer-unix.Malloc]
                   kfree(buf);
                   ^
   drivers/firmware/cirrus/cs_dsp.c:1281:6: note: Assuming 'pos' is >=3D fi=
eld 'size'
           if (pos >=3D firmware->size) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/firmware/cirrus/cs_dsp.c:1281:2: note: '?' condition is false
           if (pos >=3D firmware->size) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/firmware/cirrus/cs_dsp.c:1281:6: note: 'pos' is >=3D field 'size'
           if (pos >=3D firmware->size) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/firmware/cirrus/cs_dsp.c:1281:2: note: '?' condition is true
           if (pos >=3D firmware->size) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/firmware/cirrus/cs_dsp.c:1281:2: note: Taking true branch
           if (pos >=3D firmware->size) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/firmware/cirrus/cs_dsp.c:1282:3: note: Left side of '&&' is true
                   cs_dsp_err(dsp, "%s: file too short, %zu bytes\n",
                   ^
   drivers/firmware/cirrus/cs_dsp.c:30:2: note: expanded from macro 'cs_dsp=
_err'
           dev_err(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/firmware/cirrus/cs_dsp.c:1282:3: note: '?' condition is true
                   cs_dsp_err(dsp, "%s: file too short, %zu bytes\n",
                   ^
   drivers/firmware/cirrus/cs_dsp.c:30:2: note: expanded from macro 'cs_dsp=
_err'
           dev_err(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/firmware/cirrus/cs_dsp.c:1282:3: note: Left side of '&&' is true
                   cs_dsp_err(dsp, "%s: file too short, %zu bytes\n",
                   ^
   drivers/firmware/cirrus/cs_dsp.c:30:2: note: expanded from macro 'cs_dsp=
_err'
           dev_err(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'

vim +/buf_list +345 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c3 Simon Trimmer 2021-09-13  336  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  337  static void cs_dsp_buf_free(s=
truct list_head *list)
f6bc909e7673c3 Simon Trimmer 2021-09-13  338  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  339  	while (!list_empty(list)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  340  		struct cs_dsp_buf *buf =3D =
list_first_entry(list,
f6bc909e7673c3 Simon Trimmer 2021-09-13  341  							  struct cs_dsp_buf,
f6bc909e7673c3 Simon Trimmer 2021-09-13  342  							  list);
f6bc909e7673c3 Simon Trimmer 2021-09-13  343  		list_del(&buf->list);
f6bc909e7673c3 Simon Trimmer 2021-09-13  344  		vfree(buf->buf);
f6bc909e7673c3 Simon Trimmer 2021-09-13 @345  		kfree(buf);
f6bc909e7673c3 Simon Trimmer 2021-09-13  346  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  347  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  348  =


:::::: The code at line 345 was first introduced by commit
:::::: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7 firmware: cs_dsp: add drive=
r to support firmware loading on Cirrus Logic DSPs

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7102482470333279810==--

