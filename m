Content-Type: multipart/mixed; boundary="===============2094657816671478654=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:tiwai/sound/master 22/50] sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [...
Date: Mon, 23 May 2022 00:54:18 +0800
Message-ID: <202205230004.iRlwNqSc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2094657816671478654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Kaehn <kaehndan@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>
CC: Rob Herring <robh@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block tiwai/sound/master
head:   ed8c886b536dd53b25f3a4d43f184a407facc5af
commit: 542350509499fed057a2a56921a383888a6f4fd3 [22/50] ALSA: Add generic =
serial MIDI driver using serial bus API
:::::: branch date: 34 hours ago
:::::: commit date: 10 days ago
config: arm-randconfig-c002-20220522 (https://download.01.org/0day-ci/archi=
ve/20220523/202205230004.iRlwNqSc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443db=
aba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/542350509499fed=
057a2a56921a383888a6f4fd3
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block tiwai/sound/master
        git checkout 542350509499fed057a2a56921a383888a6f4fd3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   drivers/infiniband/core/user_mad.c:834:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&req, 0, sizeof(req));
                   ^~~~~~
   drivers/infiniband/core/user_mad.c:847:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req.method_mask, ureq.method_mask,
                   ^~~~~~
   drivers/infiniband/core/user_mad.c:847:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(req.method_mask, ureq.method_mask,
                   ^~~~~~
   Suppressed 87 warnings (83 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/most/most_snd.c:111:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(most, alsa, bytes);
           ^~~~~~
   drivers/most/most_snd.c:111:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(most, alsa, bytes);
           ^~~~~~
   drivers/most/most_snd.c:131:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alsa, most, bytes);
           ^~~~~~
   drivers/most/most_snd.c:131:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(alsa, most, bytes);
           ^~~~~~
   drivers/most/most_snd.c:245:4: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(mbo->virt_address, 0, mbo->buffer_length);
                           ^~~~~~
   drivers/most/most_snd.c:245:4: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                           memset(mbo->virt_address, 0, mbo->buffer_length);
                           ^~~~~~
   drivers/most/most_snd.c:555:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adpt->card->driver, sizeof(adpt->card->driver),
           ^~~~~~~~
   drivers/most/most_snd.c:555:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(adpt->card->driver, sizeof(adpt->card->driver),
           ^~~~~~~~
   drivers/most/most_snd.c:557:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adpt->card->shortname, sizeof(adpt->card->shortname),
           ^~~~~~~~
   drivers/most/most_snd.c:557:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(adpt->card->shortname, sizeof(adpt->card->shortname),
           ^~~~~~~~
   drivers/most/most_snd.c:559:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adpt->card->longname, sizeof(adpt->card->longname),
           ^~~~~~~~
   drivers/most/most_snd.c:559:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(adpt->card->longname, sizeof(adpt->card->longname),
           ^~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:159:3: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(e->dmac, e->neigh->ha, sizeof(e->dmac));
                   ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:159:3: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(e->dmac, e->neigh->ha, sizeof(e->dmac));
                   ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:160:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(req->dst_mac, e->dmac, sizeof(req->dst_mac));
           ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:160:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(req->dst_mac, e->dmac, sizeof(req->dst_mac));
           ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:455:4: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(e->dmac, physdev->dev_addr, sizeof(e->dma=
c));
                           ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:455:4: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(e->dmac, physdev->dev_addr, sizeof(e->dma=
c));
                           ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:456:3: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(e->addr, addr, addr_len);
                   ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:456:3: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(e->addr, addr, addr_len);
                   ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:725:4: warning: Call to functio=
n 'sprintf' is insecure as it does not provide bounding of the memory buffe=
r or security checks introduced in the C11 standard. Replace with analogous=
 functions that support length arguments or provides boundary checks such a=
s 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecate=
dOrUnsafeBufferHandling]
                           sprintf(ip, e->v6 ? "%pI6c" : "%pI4", e->addr);
                           ^~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/l2t.c:725:4: note: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11
                           sprintf(ip, e->v6 ? "%pI6c" : "%pI4", e->addr);
                           ^~~~~~~
   Suppressed 103 warnings (102 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   drivers/net/ethernet/chelsio/cxgb4/cudbg_zlib.c:44:2: warning: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&compress_stream, 0, sizeof(struct z_stream_s));
           ^~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cudbg_zlib.c:44:2: note: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&compress_stream, 0, sizeof(struct z_stream_s));
           ^~~~~~
   Suppressed 103 warnings (102 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   sound/drivers/serial-generic.c:283:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, s=
ubstream->number);
                   ^~~~~~~
   sound/drivers/serial-generic.c:283:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, s=
ubstream->number);
                   ^~~~~~~
>> sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:303:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:333:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:333:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev=
->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev=
->ctrl->nr);
           ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   106 warnings generated.
   Suppressed 106 warnings (100 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   113 warnings generated.
   Suppressed 113 warnings (107 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   Suppressed 101 warnings (97 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   Suppressed 101 warnings (97 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   103 warnings generated.
   net/rds/ib_frmr.c:153:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&reg_wr, 0, sizeof(reg_wr));
           ^~~~~~
   net/rds/ib_frmr.c:153:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&reg_wr, 0, sizeof(reg_wr));
           ^~~~~~
   net/rds/ib_frmr.c:287:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(s_wr, 0, sizeof(*s_wr));
           ^~~~~~
   net/rds/ib_frmr.c:287:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(s_wr, 0, sizeof(*s_wr));
           ^~~~~~
   Suppressed 101 warnings (97 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/iio/adc/ad7280a.c:167:8: warning: Excessive padding in 'struct a=
d7280_state' (56 padding bytes, where 24 is optimal). =

   Optimal fields order: =

   tx, =

   spi, =

   channels, =

   chain_last_alert_ignore, =

   slave_num, =

   scan_cnt, =

   readback_delay_us, =

   rx, =

   lock, =

   thermistor_term_en, =

   oversampling_ratio, =

   acquisition_time, =

   ctrl_lb, =

   cell_threshhigh, =

   cell_threshlow, =

   aux_threshhigh, =

   aux_threshlow, =

   cb_mask, =

   crc_tab, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7280_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7280a.c:167:8: note: Excessive padding in 'struct ad72=
80_state' (56 padding bytes, where 24 is optimal). Optimal fields order: tx=
, spi, channels, chain_last_alert_ignore, slave_num, scan_cnt, readback_del=
ay_us, rx, lock, thermistor_term_en, oversampling_ratio, acquisition_time, =
ctrl_lb, cell_threshhigh, cell_threshlow, aux_threshhigh, aux_threshlow, cb=
_mask, crc_tab, consider reordering the fields or adding explicit padding m=
embers
   struct ad7280_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7280a.c:768:3: warning: Value stored to 'value' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   value =3D clamp(value, 0L, 0xFFL);
                   ^
   drivers/iio/adc/ad7280a.c:768:3: note: Value stored to 'value' is never =
read
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   Suppressed 82 warnings (81 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   Suppressed 82 warnings (81 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   83 warnings generated.
   net/rxrpc/output.c:575:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&whdr, 0, sizeof(whdr));
           ^~~~~~
   net/rxrpc/output.c:575:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&whdr, 0, sizeof(whdr));
           ^~~~~~
   Suppressed 82 warnings (81 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).

vim +303 sound/drivers/serial-generic.c

542350509499fe Daniel Kaehn 2022-05-09  277  =

542350509499fe Daniel Kaehn 2022-05-09  278  static void snd_serial_generic=
_substreams(struct snd_rawmidi_str *stream, int dev_num)
542350509499fe Daniel Kaehn 2022-05-09  279  {
542350509499fe Daniel Kaehn 2022-05-09  280  	struct snd_rawmidi_substream =
*substream;
542350509499fe Daniel Kaehn 2022-05-09  281  =

542350509499fe Daniel Kaehn 2022-05-09  282  	list_for_each_entry(substream=
, &stream->substreams, list) {
542350509499fe Daniel Kaehn 2022-05-09 @283  		sprintf(substream->name, "Se=
rial MIDI %d-%d", dev_num, substream->number);
542350509499fe Daniel Kaehn 2022-05-09  284  	}
542350509499fe Daniel Kaehn 2022-05-09  285  }
542350509499fe Daniel Kaehn 2022-05-09  286  =

542350509499fe Daniel Kaehn 2022-05-09  287  static int snd_serial_generic_=
rmidi(struct snd_serial_generic *drvdata,
542350509499fe Daniel Kaehn 2022-05-09  288  				int outs, int ins, struct =
snd_rawmidi **rmidi)
542350509499fe Daniel Kaehn 2022-05-09  289  {
542350509499fe Daniel Kaehn 2022-05-09  290  	struct snd_rawmidi *rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  291  	int err;
542350509499fe Daniel Kaehn 2022-05-09  292  =

542350509499fe Daniel Kaehn 2022-05-09  293  	err =3D snd_rawmidi_new(drvda=
ta->card, drvdata->card->driver, 0,
542350509499fe Daniel Kaehn 2022-05-09  294  				outs, ins, &rrawmidi);
542350509499fe Daniel Kaehn 2022-05-09  295  =

542350509499fe Daniel Kaehn 2022-05-09  296  	if (err < 0)
542350509499fe Daniel Kaehn 2022-05-09  297  		return err;
542350509499fe Daniel Kaehn 2022-05-09  298  =

542350509499fe Daniel Kaehn 2022-05-09  299  	snd_rawmidi_set_ops(rrawmidi,=
 SNDRV_RAWMIDI_STREAM_INPUT,
542350509499fe Daniel Kaehn 2022-05-09  300  				&snd_serial_generic_input);
542350509499fe Daniel Kaehn 2022-05-09  301  	snd_rawmidi_set_ops(rrawmidi,=
 SNDRV_RAWMIDI_STREAM_OUTPUT,
542350509499fe Daniel Kaehn 2022-05-09  302  				&snd_serial_generic_output=
);
542350509499fe Daniel Kaehn 2022-05-09 @303  	strcpy(rrawmidi->name, drvdat=
a->card->shortname);
542350509499fe Daniel Kaehn 2022-05-09  304  =

542350509499fe Daniel Kaehn 2022-05-09  305  	snd_serial_generic_substreams=
(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT],
542350509499fe Daniel Kaehn 2022-05-09  306  					drvdata->serdev->ctrl->nr=
);
542350509499fe Daniel Kaehn 2022-05-09  307  	snd_serial_generic_substreams=
(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT],
542350509499fe Daniel Kaehn 2022-05-09  308  					drvdata->serdev->ctrl->nr=
);
542350509499fe Daniel Kaehn 2022-05-09  309  =

542350509499fe Daniel Kaehn 2022-05-09  310  	rrawmidi->info_flags =3D SNDR=
V_RAWMIDI_INFO_OUTPUT |
542350509499fe Daniel Kaehn 2022-05-09  311  			       SNDRV_RAWMIDI_INFO_I=
NPUT |
542350509499fe Daniel Kaehn 2022-05-09  312  			       SNDRV_RAWMIDI_INFO_D=
UPLEX;
542350509499fe Daniel Kaehn 2022-05-09  313  =

542350509499fe Daniel Kaehn 2022-05-09  314  	if (rmidi)
542350509499fe Daniel Kaehn 2022-05-09  315  		*rmidi =3D rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  316  	return 0;
542350509499fe Daniel Kaehn 2022-05-09  317  }
542350509499fe Daniel Kaehn 2022-05-09  318  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2094657816671478654==--

