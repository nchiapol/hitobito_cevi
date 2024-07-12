#  Copyright (c) 2023, Cevi.DB Steuergruppe. This file is part of
#  hitobito_cevi and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_cevi.

class Group::SportTeamGruppe < Group
  children Group::SportTeamGruppe

  ### ROLES

  class Leiter < ::Role
    self.permissions = [:group_and_below_full]
  end

  class Mitglied < ::Role
    self.permissions = [:group_read]

    self.visible_from_above = false
  end

  roles Leiter,
    Mitglied
end
