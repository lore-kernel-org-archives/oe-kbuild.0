Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4480710E9
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jan 2023 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674554636; x=1706090636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UDAR7JXhqHJv4DhxqQl1LZSEIvx7cluGTILNotuwvu0=;
  b=OJ69+6M5ZBUm4jWEW/ZM6xyIN/dOH0CEn6Nsl+FTdABd7dJtvcP49HUW
   B7HtLqscGFFjn4B5yoesDbd4o/S0ffgPKzU7hfifaio+gKM/qCygjksWN
   HpVztQxbfv+hFI+Wu+YB/o6mmUOMM4xISfHyOUr0hSTiCKwnDcM33+VTV
   8x4di8r1qUzhxoIuKqf2UAyovWeFX4mal7PpUi0IOPyLQjq1EwlJMMrry
   GHyhQ18FrPcUC/gQYX4VMN4aTUhBue2spkxRafvjwRmT7N2XWx29M5rvE
   sFj7kA7oWga+nPHHrJAeYLpud2ApnlKgbk9F0weGsR7c/+gFlA5pPkbDx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306616113"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="306616113"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804528480"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="804528480"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 02:03:54 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKG9c-0006Jy-23;
	Tue, 24 Jan 2023 10:03:48 +0000
Date: Tue, 24 Jan 2023 18:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/usb/mixer.c:2172:16: warning: The left expression of the
 compound assignment is an uninitialized value. The computed value will also
 be garbage [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202301241821.F9ZIyrvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: sound/usb/mixer.c:2172:16: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7bf70dbb18820b37406fdfa2aaf14c2f5c71a11a
commit: 281d0c962752fb40866dd8d4cade68656f34bd1f fortify: Add Clang support
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20230118 (https://download.01.org/0day-ci/archive/20230124/202301241821.F9ZIyrvi-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=281d0c962752fb40866dd8d4cade68656f34bd1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 281d0c962752fb40866dd8d4cade68656f34bd1f
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                  ^  ~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/pci/hda/hda_generic.c:2826:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/hda_generic.c:2826:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/hda_generic.c:2939:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name, text);
           ^~~~~~
   sound/pci/hda/hda_generic.c:2939:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name, text);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   sound/usb/mixer.c:677:4: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:677:4: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:680:4: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:680:4: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:683:4: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:683:4: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:686:4: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:686:4: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:695:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:695:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:698:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:698:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:701:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:701:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:704:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:704:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:710:4: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, names->name);
                           ^~~~~~
   sound/usb/mixer.c:710:4: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                           strcpy(name, names->name);
                           ^~~~~~
>> sound/usb/mixer.c:2172:16: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
                           cval->cmask |= (1 << i);
                                       ^
   sound/usb/mixer.c:3563:6: note: Assuming 'mixer' is non-null
           if (!mixer)
               ^~~~~~
   sound/usb/mixer.c:3563:2: note: Taking false branch
           if (!mixer)
           ^
   sound/usb/mixer.c:3566:29: note: Assuming the condition is false
           mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3569:6: note: Assuming field 'id_elems' is non-null
           if (!mixer->id_elems) {
               ^~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3569:2: note: Taking false branch
           if (!mixer->id_elems) {
           ^
   sound/usb/mixer.c:3575:2: note: Control jumps to the 'default' case at line 3577
           switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
           ^
   sound/usb/mixer.c:3579:3: note:  Execution continues on line 3588
                   break;
                   ^
   sound/usb/mixer.c:3588:13: note: Field 'protocol' is not equal to UAC_VERSION_3
           if (mixer->protocol == UAC_VERSION_3 &&
                      ^
   sound/usb/mixer.c:3588:39: note: Left side of '&&' is false
           if (mixer->protocol == UAC_VERSION_3 &&
                                                ^
   sound/usb/mixer.c:3594:9: note: Calling 'snd_usb_mixer_controls'
                   err = snd_usb_mixer_controls(mixer);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3223:2: note: Loop condition is false. Execution continues on line 3232
           for (map = usbmix_ctl_maps; map->id; map++) {
           ^
   sound/usb/mixer.c:3233:9: note: Assuming the condition is true
           while ((p = snd_usb_find_csint_desc(mixer->hostif->extra,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3233:2: note: Loop condition is true.  Entering loop body
           while ((p = snd_usb_find_csint_desc(mixer->hostif->extra,
           ^
   sound/usb/mixer.c:3236:7: note: Assuming the condition is false
                   if (!snd_usb_validate_audio_desc(p, mixer->protocol))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3236:3: note: Taking false branch
                   if (!snd_usb_validate_audio_desc(p, mixer->protocol))
                   ^
   sound/usb/mixer.c:3239:14: note: Field 'protocol' is equal to UAC_VERSION_1
                   if (mixer->protocol == UAC_VERSION_1) {
                              ^
   sound/usb/mixer.c:3239:3: note: Taking true branch
                   if (mixer->protocol == UAC_VERSION_1) {
                   ^
   sound/usb/mixer.c:3247:10: note: Calling 'parse_audio_unit'
                           err = parse_audio_unit(&state, desc->bSourceID);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2867:6: note: Assuming the condition is false
           if (test_and_set_bit(unitid, state->unitbitmap))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2867:2: note: Taking false branch
           if (test_and_set_bit(unitid, state->unitbitmap))
           ^
   sound/usb/mixer.c:2871:7: note: 'p1' is non-null
           if (!p1) {
                ^~
   sound/usb/mixer.c:2871:2: note: Taking false branch
           if (!p1) {
           ^
   sound/usb/mixer.c:2876:6: note: Assuming the condition is false
           if (!snd_usb_validate_audio_desc(p1, protocol)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2876:2: note: Taking false branch
           if (!snd_usb_validate_audio_desc(p1, protocol)) {
           ^
   sound/usb/mixer.c:2881:2: note: Control jumps to 'case 4:'  at line 2886
           switch (PTYPE(protocol, p1[2])) {
           ^
   sound/usb/mixer.c:2889:10: note: Calling 'parse_audio_mixer_unit'
                   return parse_audio_mixer_unit(state, unitid, p1);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2243:6: note: Assuming 'err' is >= 0
           if (err < 0) {
               ^~~~~~~
   sound/usb/mixer.c:2243:2: note: Taking false branch
           if (err < 0) {
           ^
   sound/usb/mixer.c:2255:16: note: Assuming 'pin' is < 'input_pins'
           for (pin = 0; pin < input_pins; pin++) {
                         ^~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2255:2: note: Loop condition is true.  Entering loop body
           for (pin = 0; pin < input_pins; pin++) {
           ^
   sound/usb/mixer.c:2257:7: note: Assuming 'err' is >= 0
                   if (err < 0)
                       ^~~~~~~
   sound/usb/mixer.c:2257:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer.c:2260:7: note: Assuming 'num_outs' is not equal to 0
                   if (!num_outs)

vim +2172 sound/usb/mixer.c

f9f0e9ed350e15 sound/usb/mixer.c    Takashi Iwai    2019-08-20  2140  
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2141  /*
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2142   * build a mixer unit control
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2143   *
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2144   * the callbacks are identical with feature unit.
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2145   * input channel number (zero based) is given in control field instead.
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2146   */
99fc86450c4390 sound/usb/mixer.c    Daniel Mack     2010-03-11  2147  static void build_mixer_unit_ctl(struct mixer_build *state,
99fc86450c4390 sound/usb/mixer.c    Daniel Mack     2010-03-11  2148  				 struct uac_mixer_unit_descriptor *desc,
6cfd839ae78ec3 sound/usb/mixer.c    Jorge Sanjuan   2018-05-11  2149  				 int in_pin, int in_ch, int num_outs,
6cfd839ae78ec3 sound/usb/mixer.c    Jorge Sanjuan   2018-05-11  2150  				 int unitid, struct usb_audio_term *iterm)
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2151  {
86e07d34658bb8 sound/usb/usbmixer.c Takashi Iwai    2005-11-17  2152  	struct usb_mixer_elem_info *cval;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2153  	unsigned int i, len;
86e07d34658bb8 sound/usb/usbmixer.c Takashi Iwai    2005-11-17  2154  	struct snd_kcontrol *kctl;
c3a3e040f01457 sound/usb/usbmixer.c Jaroslav Kysela 2010-02-11  2155  	const struct usbmix_name_map *map;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2156  
17156f23e93c0f sound/usb/mixer.c    Ruslan Bilovol  2018-05-04  2157  	map = find_map(state->map, unitid, 0);
c3a3e040f01457 sound/usb/usbmixer.c Jaroslav Kysela 2010-02-11  2158  	if (check_ignored_ctl(map))
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2159  		return;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2160  
561b220a4dece1 sound/usb/usbmixer.c Takashi Iwai    2005-09-09  2161  	cval = kzalloc(sizeof(*cval), GFP_KERNEL);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2162  	if (!cval)
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2163  		return;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2164  
3360b84b8ed1f0 sound/usb/mixer.c    Takashi Iwai    2014-11-18  2165  	snd_usb_mixer_elem_init_std(&cval->head, state->mixer, unitid);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2166  	cval->control = in_ch + 1; /* based on 1 */
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2167  	cval->val_type = USB_MIXER_S16;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2168  	for (i = 0; i < num_outs; i++) {
6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2169  		__u8 *c = uac_mixer_unit_bmControls(desc, state->mixer->protocol);
6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2170  
6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2171  		if (check_matrix_bitmap(c, in_ch, i, num_outs)) {
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16 @2172  			cval->cmask |= (1 << i);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2173  			cval->channels++;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2174  		}
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2175  	}
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2176  
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2177  	/* get min/max values */
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2178  	get_min_max(cval, 0);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2179  
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2180  	kctl = snd_ctl_new1(&usb_feature_unit_ctl, cval);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2181  	if (!kctl) {
0ba41d917eeb87 sound/usb/mixer.c    Takashi Iwai    2014-02-26  2182  		usb_audio_err(state->chip, "cannot malloc kcontrol\n");
52c3e317a85709 sound/usb/mixer.c    Takashi Iwai    2019-08-22  2183  		usb_mixer_elem_info_free(cval);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2184  		return;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2185  	}
eef90451605d79 sound/usb/mixer.c    Chris J Arges   2014-11-12  2186  	kctl->private_free = snd_usb_mixer_elem_free;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2187  
c3a3e040f01457 sound/usb/usbmixer.c Jaroslav Kysela 2010-02-11  2188  	len = check_mapped_name(map, kctl->id.name, sizeof(kctl->id.name));
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2189  	if (!len)
eccfc1b868a990 sound/usb/mixer.c    Ruslan Bilovol  2018-05-04  2190  		len = get_term_name(state->chip, iterm, kctl->id.name,
6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2191  				    sizeof(kctl->id.name), 0);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2192  	if (!len)
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2193  		len = sprintf(kctl->id.name, "Mixer Source %d", in_ch + 1);
08d1e635089f41 sound/usb/usbmixer.c Takashi Iwai    2009-10-02  2194  	append_ctl_name(kctl, " Volume");
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2195  
0ba41d917eeb87 sound/usb/mixer.c    Takashi Iwai    2014-02-26  2196  	usb_audio_dbg(state->chip, "[%d] MU [%s] ch = %d, val = %d/%d\n",
3360b84b8ed1f0 sound/usb/mixer.c    Takashi Iwai    2014-11-18  2197  		    cval->head.id, kctl->id.name, cval->channels, cval->min, cval->max);
3360b84b8ed1f0 sound/usb/mixer.c    Takashi Iwai    2014-11-18  2198  	snd_usb_mixer_add_control(&cval->head, kctl);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2199  }
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2200  

:::::: The code at line 2172 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
